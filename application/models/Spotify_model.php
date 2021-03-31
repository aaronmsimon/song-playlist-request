<?php

  class Spotify_model extends CI_Model {

    const clientID = 'cfdd0ea5497f4b119cf7ae3d74430c33';
    const clientSecret = '3a54655e67b041e0888714ff692a26bd';

    public function __construct() {
      parent::__construct();
      $this->load->database();
    }

    public function getToken() {
      $curl = curl_init();

      curl_setopt($curl, CURLOPT_URL, 'https://accounts.spotify.com/api/token');
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curl, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
      curl_setopt($curl, CURLOPT_POST, 1);

      $client_auth = base64_encode(self::clientID . ':' . self::clientSecret);
      $headers = array();
      $headers[] = "Authorization: Basic $client_auth";
      $headers[] = 'Content-Type: application/x-www-form-urlencoded';
      curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

      $result = json_decode(curl_exec($curl));

      if (curl_errno($curl)) {
          echo 'Error:' . curl_error($curl);
      }
      curl_close ($curl);

      return $result->access_token;
    }

    public function performSearch($searchString,$offset,$limit) {
      $curl = curl_init();
      $queryarray = array(
        'q' => $searchString,
        'type' => 'track',
        'offset' => $offset,
        'limit' => $limit
      );
      $query = http_build_query($queryarray);
      $url = "https://api.spotify.com/v1/search?$query";
      curl_setopt($curl, CURLOPT_URL, $url);
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'GET');

      $access_token = $this->getToken();
      $headers = array();
      $headers[] = "Authorization: Bearer $access_token";
      curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

      $result = curl_exec($curl);
      return json_decode($result);

      if (curl_errno($curl)) {
          echo 'Error:' . curl_error($curl);
      }
      curl_close ($curl);
    }

    public function predefinedSearch($url) {
      $curl = curl_init();
      curl_setopt($curl, CURLOPT_URL, $url);
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'GET');

      $access_token = $this->getToken();
      $headers = array();
      $headers[] = "Authorization: Bearer $access_token";
      curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

      $result = curl_exec($curl);
      return json_decode($result);

      if (curl_errno($curl)) {
          echo 'Error:' . curl_error($curl);
      }
      curl_close ($curl);
    }

  }
?>
