<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reaksi extends MY_Controller {

	public $userdata = false;

	public function __construct(){
		parent::__construct();
		$this->userdata = $this->session->userdata();
		$this->load->model("M_Pesanan");
		//if( isset($this->userdata['role']) AND $this->userdata['role'] != 'admin' OR !isset($this->userdata['role']) ) show_404();
	}

	public function index()
	{

		if( isset($_POST['id_pesanan']) ){
			$data = [
				"status"	=> $_POST['status'],
				"note"		=> $_POST['note']
			];
			$id_pesanan = $_POST['id_pesanan'];
		}

		$list = $this->M_Pesanan->reaksi_darah();
		$this->render('page/admin/reaksi',[
			"list"	=> $list
		]);
	}

	
}
