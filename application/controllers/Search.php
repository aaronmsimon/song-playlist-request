<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Search extends MY_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model('spotify_model');
		$this->load->model('playlist_model');
	}

	public function index()
	{
		if( $this->require_min_level(1) ) {
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
			if ($this->auth_level >= 6) {
				$this->twig->display('results.php',$this->data);
			} else {
				$this->data['content'] = '<h1>Please confirm your email before continuing.</h1><p>Go to <a href="' . $this->config->item('base_url') . '">Playlist</a></p>';
				$this->twig->display('confirmemail.php',$this->data);
			}
		}
	}

	public function results() {
		if( $this->require_min_level(1) ) {
	    $searchString = $_POST['search-string'];
	    if (empty($_POST['offset'])) {
	      $offset = 0;
	    } else {
	      $offset = $_POST['offset'];
	    }
			$limit = 5;
	    $this->data['results'] = $this->spotify_model->performSearch($searchString,$offset,$limit);
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
	    $this->twig->display('results.php',$this->data);
		}
	}

  public function next() {
		if( $this->require_min_level(1) ) {
	    $url = $_POST['nexturl'];
	    $this->data['results'] = $this->spotify_model->predefinedSearch($url);
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
			$this->twig->display('results.php',$this->data);
		}
	}

  public function prev() {
		if( $this->require_min_level(1) ) {
	    $url = $_POST['prevurl'];
	    $this->data['results'] = $this->spotify_model->predefinedSearch($url);
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
			$this->twig->display('results.php',$this->data);
		}
	}

	public function song_added() {
		if( $this->require_min_level(1) ) {
			$message = $this->playlist_model->getMessage();
			$this->data['pic'] = sprintf('%02d', $message->id);
			$this->data['message'] = $message->message;
			$this->data['user'] = array(
				'name' => $this->auth_username,
				'level' => $this->auth_level
			);
			$this->twig->display('songadded.php',$this->data);
		}
	}

	/*
	 * AJAX FUNCTIONS
	 *
	 */

	public function insert_song() {
		if( $this->require_min_level(1) ) {
			$search_href = $_POST['search_href'];
			$song_index = $_POST['song_index'];

			$results = $this->spotify_model->predefinedSearch($search_href);
			$song = $results->tracks->items[$song_index];
			$name = $song->name;
			$artist = $song->artists[0]->name;
			$uri = $song->uri;
			$img_url = $song->album->images[1]->url;
			$userid = $this->auth_user_id;

			$insertid = $this->playlist_model->insertSong($name,$artist,$uri,$img_url,$userid);
			echo $insertid;
		}
	}

	public function mark_played() {
		if( $this->require_min_level(9) ) {
			$songid = $_POST['songid'];
			$this->playlist_model->markPlayed($songid);
		}
	}
}
