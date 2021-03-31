<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends MY_Controller
{
	public function __construct()
	{
		parent::__construct();

		// Force SSL
		//$this->force_ssl();

		// Form and URL helpers always loaded (just for convenience)
		$this->load->helper('url');
		$this->load->helper('form');
	}

	public function index()
	{
		if( $this->require_role('admin') )
		{
			echo '<p>You are logged in!</p>';
		}
	}

	public function login()
	{
		// Method should not be directly accessible
		if( $this->uri->uri_string() == 'user/login') {
			show_404();
		}

		if( strtolower( $_SERVER['REQUEST_METHOD'] ) == 'post' ) {
			$this->require_min_level(1);
		}

		$this->setup_login_form();
		$this->data['form_open'] = form_open($this->load->get_var('login_url'), ['class' => 'std-form']);
		$this->twig->display('auth/login.php',$this->data);
	}

	public function logout()
	{
		$this->authentication->logout();

		// Set redirect protocol
		$redirect_protocol = USE_SSL ? 'https' : NULL;

		// redirect( site_url( LOGIN_PAGE . '?logout=1', $redirect_protocol ) );
		redirect(base_url());
	}

	public function verify($token) {
		if( $this->require_min_level(1) )
		{
			$this->load->model('user_model');
			if ($this->user_model->verifyUser($this->auth_user_id,$token)) {
				redirect(base_url('search'));
			} else {
				echo 'Error in verification. User not verified.';
			}
		}
	}

	public function recover()
	{
		// Load resources
		$this->load->model('user_model');

		/// If IP or posted email is on hold, display message
		if( $on_hold = $this->authentication->current_hold_status( TRUE ) )
		{
			$view_data['disabled'] = 1;
		}
		else
		{
			// If the form post looks good
			if( $this->tokens->match && $this->input->post('email') )
			{
				if( $user_data = $this->user_model->get_recovery_data( $this->input->post('email') ) )
				{
					// Check if user is banned
					if( $user_data->banned == '1' )
					{
						// Log an error if banned
						$this->authentication->log_error( $this->input->post('email', TRUE ) );

						// Show special message for banned user
						$view_data['banned'] = 1;
					}
					else
					{
						/**
						 * Use the authentication libraries salt generator for a random string
						 * that will be hashed and stored as the password recovery key.
						 * Method is called 4 times for a 88 character string, and then
						 * trimmed to 72 characters
						 */
						$recovery_code = substr( $this->authentication->random_salt()
							. $this->authentication->random_salt()
							. $this->authentication->random_salt()
							. $this->authentication->random_salt(), 0, 72 );

						// Update user record with recovery code and time
						$this->user_model->update_user_raw_data(
							$user_data->user_id,
							[
								'passwd_recovery_code' => $this->authentication->hash_passwd($recovery_code),
								'passwd_recovery_date' => date('Y-m-d H:i:s')
							]
						);

						// Set the link protocol
						$link_protocol = USE_SSL ? 'https' : NULL;

						// Set URI of link
						$link_uri = 'user/recovery_verification/' . $user_data->user_id . '/' . $recovery_code;

						$view_data['special_link'] = anchor(
							site_url( $link_uri, $link_protocol ),
							site_url( $link_uri, $link_protocol ),
							'target ="_blank"'
						);

						$view_data['confirmation'] = 1;

						$this->user_model->send_recovery_email($user_data->email,$view_data['special_link']);
					}
				}

				// There was no match, log an error, and display a message
				else
				{
					// Log the error
					$this->authentication->log_error( $this->input->post('email', TRUE ) );

					$view_data['no_match'] = 1;
				}
			}
		}

		// $this->twig->display('auth/recover_form.php',( isset( $view_data ) ) ? $view_data : '');
		echo $this->load->view('auth/recover_form', ( isset( $view_data ) ) ? $view_data : '', TRUE );

	}

	public function register() {
		$this->data['form_open'] = form_open($this->config->item('base_url') . 'user/created');
		$this->twig->display('auth/register.php',$this->data);
	}

	public function created() {
		$username = $_POST['username'];
		$password = $_POST['pass'];
		$verifypassword = $_POST['verifypass'];
		$email = $_POST['email'];

		$user_data = [
			'username'   => $username,
			'passwd'     => $password,
			'email'      => $email,
			'auth_level' => '6', // 9 if you want to login @ examples/index.
		];

		$this->is_logged_in();

		// Load resources
		$this->load->helper('auth');
		$this->load->model('user_model');
		$this->load->model('validation_callables');
		$this->load->library('form_validation');

		$this->form_validation->set_data( $user_data );

		$validation_rules = [
			[
				'field' => 'username',
				'label' => 'username',
				'rules' => 'max_length[12]|is_unique[' . db_table('user_table') . '.username]',
				'errors' => [
					'is_unique' => 'Username already in use.'
				]
			],
			[
				'field' => 'passwd',
				'label' => 'passwd',
				'rules' => [
					'trim',
					'required',
					[
						'_check_password_strength',
						[ $this->validation_callables, '_check_password_strength' ]
					]
				],
				'errors' => [
					'required' => 'The password field is required.'
				]
			],
			[
				'field'  => 'email',
				'label'  => 'email',
				'rules'  => 'trim|required|valid_email|is_unique[' . db_table('user_table') . '.email]',
				'errors' => [
					'is_unique' => 'Email address already in use.'
				]
			],
			[
				'field' => 'auth_level',
				'label' => 'auth_level',
				'rules' => 'required|integer|in_list[1,6,9]'
			]
		];

		$this->form_validation->set_rules( $validation_rules );

		if( $this->form_validation->run() && $password == $verifypassword )
		{
			$user_data['passwd']     = $this->authentication->hash_passwd($user_data['passwd']);
			$user_data['user_id']    = $this->user_model->get_unused_id();
			$user_data['created_at'] = date('Y-m-d H:i:s');

			// If username is not used, it must be entered into the record as NULL
			if( empty( $user_data['username'] ) )
			{
				$user_data['username'] = NULL;
			}

			// Add UUID
			$uid = $this->user_model->createToken($user_data['user_id']);
			$user_data['uuid'] = $uid['uuid'];
			$this->db->set($user_data)
				->insert(db_table('user_table'));

			if( $this->db->affected_rows() == 1 ) {
				// $this->data['content'] = '<h1>Congratulations</h1>' . '<p>User ' . $user_data['username'] . ' was created.</p><p>You will need to confirm your email before adding a song to the playlist.</p><p>Go to <a href="' . $this->config->item('base_url') . '">Playlist</a></p>';
				// $this->user_model->send_verify_email($username,$user_data['user_id'],$email,$uid,$this->data);

				$this->load->model('auth_model');
			  // Get normal authentication data using email address
			  if( $auth_data = $this->auth_model->get_auth_data( $email ) )
			  {
			    /**
			     * If redirect param exists, user redirected there.
			     * This is entirely optional, and can be removed if
			     * no redirect is desired.
			     */
			    $this->authentication->redirect_after_login();
			    // Set auth related session / cookies
			    $this->authentication->maintain_state( $auth_data );
			  }
			}
		}
		else
		{
			$this->data['content'] = '<h1>Password does not match.</h1>' . validation_errors();
		}

		$this->twig->display('confirmemail.php',$this->data);
	}

	/**
	 * Verification of a user by email for recovery
	 *
	 * @param  int     the user ID
	 * @param  string  the passwd recovery code
	 */
	public function recovery_verification( $user_id = '', $recovery_code = '' )
	{
		/// If IP is on hold, display message
		if( $on_hold = $this->authentication->current_hold_status( TRUE ) )
		{
			$view_data['disabled'] = 1;
		}
		else
		{
			// Load resources
			$this->load->model('user_model');

			if(
				/**
				 * Make sure that $user_id is a number and less
				 * than or equal to 10 characters long
				 */
				is_numeric( $user_id ) && strlen( $user_id ) <= 10 &&

				/**
				 * Make sure that $recovery code is exactly 72 characters long
				 */
				strlen( $recovery_code ) == 72 &&

				/**
				 * Try to get a hashed password recovery
				 * code and user salt for the user.
				 */
				$recovery_data = $this->user_model->get_recovery_verification_data( $user_id ) )
			{
				/**
				 * Check that the recovery code from the
				 * email matches the hashed recovery code.
				 */
				if( $recovery_data->passwd_recovery_code == $this->authentication->check_passwd( $recovery_data->passwd_recovery_code, $recovery_code ) )
				{
					$view_data['user_id']       = $user_id;
					$view_data['username']     = $recovery_data->username;
					$view_data['recovery_code'] = $recovery_data->passwd_recovery_code;
				}

				// Link is bad so show message
				else
				{
					$view_data['recovery_error'] = 1;

					// Log an error
					$this->authentication->log_error('');
				}
			}

			// Link is bad so show message
			else
			{
				$view_data['recovery_error'] = 1;

				// Log an error
				$this->authentication->log_error('');
			}

			/**
			 * If form submission is attempting to change password
			 */
			if( $this->tokens->match )
			{
				$this->user_model->recovery_password_change();
			}
		}


		echo $this->load->view( 'auth/choose_password_form', $view_data, TRUE );

	}

}
