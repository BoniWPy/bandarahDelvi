<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reaksi extends MY_Controller {

	public $userdata = false;

	public function __construct(){
		parent::__construct();
		// //mengaktifkan debugging
		// $this->output->enable_profiler(TRUE);
		$this->userdata = $this->session->userdata();
		$this->load->model("M_Pesanan");
		
	}

	public function index()
	{
		
		if( isset($_POST['jumlah']) ){

			
				$insert = [
					"id_user"	=> $this->userdata['id_user'],
					"nama_user"	=> $this->userdata['nama_user'],
					"data"		=> json_encode($data)
				];

				$rs = $this->M_Pesanan->reaksi($insert);

				
            }
            $this->render('page/reaksi');
		}

		
	
}
