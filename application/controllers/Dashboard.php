<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

	public $userdata = false;

	public function __construct(){
		parent::__construct();
		// //mengaktifkan debugging
		// $this->output->enable_profiler(TRUE);
		$this->userdata = $this->session->userdata();
		if( !isset($this->userdata['id_user']) ){
			redirect("/login");
		}
	}

	public function index()
	{
		$this->render("page/dashboard");
		
	}

	public function logout(){
		$this->session->sess_destroy();
    	redirect('/login');
	}

	public function cekstok($limit=3){

		$data = $this->db->query("SELECT * FROM darah WHERE stok < $limit")->result_array();
		

		if( count($data) > 0 ){

			$res = 'Stok | ';
			foreach ($data as $key => $value) {
				$res .= $value['golongan'].",";
			}

			$res = rtrim($res,",")." | sudah kurang dari $limit";
			echo $res;
		}

	}

	public function pesanan(){
		$data = $this->db->query("SELECT * FROM pesanan WHERE status = 'waiting'")->result_array();

		if( count($data) > 0 )  {
			echo "Ada ".count($data)." pesanan menunggu";
		}
		
	}
}
