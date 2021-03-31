<?php

  class Playlist_model extends CI_Model {

    public function __construct() {
      parent::__construct();
      $this->load->database();
    }

    public function insertSong($name,$artist,$uri,$img_url,$userid) {
      date_default_timezone_set('UTC');
      $insertdatetime = date('Y-m-d H:i:s');

      $data = array(
        'name' => $name,
        'artist' => $artist,
        'uri' => $uri,
        'img_url' => $img_url,
        'insertdatetime' => $insertdatetime,
        'requestedby' => $userid,
        'played' => 0,
        'playdatetime' => null
      );
      $insert = $this->db->insert('playlist',$data);
      if ($insert) {
				// return $this->db->insert_id();
        return 'requested by: ' . $data['requestedby'];
			} else {
				return false;
			}
    }

    public function loadPlaylist() {
      $this->db->select();
      $this->db->from('playlist as p');
      $this->db->join('users as u','p.requestedby = u.user_id');
      $this->db->where('p.played',0);
      $this->db->order_by('u.auth_level DESC, p.insertdatetime ASC');
      $query = $this->db->get();
      return $query->result();
    }

    public function getMessage() {
      $this->db->select();
      $this->db->from('messages');
      $this->db->order_by('RAND()',false);
      $this->db->limit(1);
      $query = $this->db->get();
      return $query->row();
    }

    public function markPlayed($songid) {
      date_default_timezone_set('UTC');
      $playdatetime = date('Y-m-d H:i:s');

      $this->db->set(array(
        'played' => 1,
        'playdatetime' => $playdatetime
      ));
      $this->db->where('id',$songid);
      $this->db->update('playlist');
    }

  }
?>
