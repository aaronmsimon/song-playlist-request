<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model('spotify_model');
		$this->load->model('playlist_model');
	}

	public function index()
	{
		if( $this->verify_min_level(1) )
		{
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
		}
		$this->data['playlist'] = $this->playlist_model->loadPlaylist();
		$this->twig->display('home.php',$this->data);
	}

}
