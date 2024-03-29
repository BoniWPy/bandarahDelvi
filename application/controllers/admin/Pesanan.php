<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pesanan extends MY_Controller {

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
			
			if($_POST['status'] == "cancel"){
			  $getDataPesanan = $this->M_Pesanan->list_data();
			  foreach($getDataPesanan as $data2){
			   $idDarah = $data2['id_darah'];
			   $jumlahKeluar = $data2['jumlah'];
			  }
			  $queryManualUpdateDarah = "UPDATE darah set stok = stok + $jumlahKeluar where id_darah = '$idDarah' ";
			  $this->db->query($queryManualUpdateDarah);
			}
			$update = $this->M_Pesanan->update($id_pesanan,$data);
			

			if( $update ){
				$this->session->set_flashdata("alert","<div class='alert alert-success'>Berhasil update pesanan</div>");
			}else{
				$this->session->set_flashdata("alert","<div class='alert alert-danger'>Gagal update pesanan</div>");
			}
		}

		$list = $this->M_Pesanan->list_data();
		
		$this->render('page/admin/pesanan',[
			"list"	=> $list
		]);
		
	}

	public function detail($id){

		$detail = $this->M_Darah->detail($id);
		

		echo json_encode($detail[0]);

	}

	public function grafik(){

		$data = $this->db->query("
			SELECT golongan,SUM(stok) as stok FROM darah GROUP BY golongan
		")->result_array();

		$grafik["label"] = $grafik['val'] = '';

		foreach ($data as $key => $value) {
			$grafik['label'] .= "'".$value['golongan']."'," ;
			$grafik['val'] .= "".$value['stok'].",";
		}

		$this->render("page/grafik_stok.php",$grafik);
	}

	public function reaksi(){

		if( isset($_POST['id_pesanan']) ){
			$data = [
				"reaksi_darah"	=> $_POST['reaksi_darah']
				
			];

			$id_pesanan = $_POST['id_pesanan'];
			

			$update = $this->M_Pesanan->update($id_pesanan,$data);
			

			if( $update ){
				$this->session->set_flashdata("alert","<div class='alert alert-success'>Berhasil update reaksi</div>");
			}else{
				$this->session->set_flashdata("alert","<div class='alert alert-danger'>Gagal update reaksi</div>");
			}
		}

		$list = $this->M_Pesanan->reaksi_darah();
		
		$this->render('page/admin/reaksi',[
			"list"	=> $list
		]);
		
	}

}
