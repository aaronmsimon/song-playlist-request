<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Community Auth - MY Controller
 *
 * Community Auth is an open source authentication application for CodeIgniter 3
 *
 * @package     Community Auth
 * @author      Robert B Gottier
 * @copyright   Copyright (c) 2011 - 2018, Robert B Gottier. (http://brianswebdesign.com/)
 * @license     BSD - http://www.opensource.org/licenses/BSD-3-Clause
 * @link        http://community-auth.com
 */

require_once APPPATH . 'third_party/community_auth/core/Auth_Controller.php';

class MY_Controller extends Auth_Controller
{

	public function __construct()
	{
		parent::__construct();

		// Globals
		$this->data['base_url'] = $this->config->item('base_url');
		$this->data['site_name'] = $this->config->item('site_name');
		$this->data['jquery_vers'] = $this->config->item('jquery_vers');
		$this->data['jqueryui_theme'] = $this->config->item('jqueryui_theme');
	}
}
