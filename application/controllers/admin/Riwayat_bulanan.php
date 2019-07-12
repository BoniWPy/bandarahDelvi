<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Riwayat_bulanan extends MY_Controller {

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

		$list = $this->M_Pesanan->riwayat_bulanan();
		$this->render('page/admin/riwayat_bulanan',[
			"list"	=> $list
		]);
	}

	public function laporan_pdf(){
		
			$data = array(
				"dataku" => array(
					"nama" => "Petani Kode",
					"url" => "http://petanikode.com"
				)
			); 
			
			
			$this->load->library('pdf');
		
			$this->pdf->setPaper('A4', 'potrait');
			$this->pdf->filename = "laporan-darah.pdf";
			$this->pdf->load_view('laporan_pdf', $data);
		
		
		}
	}

	

