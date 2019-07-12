<h1 class="mb-3 pt-3">Reaksi Transfusi</h1>

<div class="row">
	<div class="card card-body">
		<?php echo $this->session->flashdata("alert") ?>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<th>ID</th>
                    <th>Nama Pasien</th>
					<th>Golongan</th>
                    <th>Nama Dokter</th>
                    <th>Catatan Reaksi Transfusi</th>
					<th>Tanggal</th>
				</thead>
				<tbody>
				<?php foreach($list as $data){ ?>
					<tr>
						<td><?php echo $data['id_pesanan'] ?></td>
                        <td><?php $encodeValue = json_decode ($data['data'],true); echo $encodeValue['nama_pasien'];?></td>
						<td><?php echo $data['golongan'] ?></td>
						<td><?php $encodeValue = json_decode ($data['data'],true); echo $encodeValue['dokter'];?></td>
                        <td><?php echo $data['reaksi_darah'] ?></td>
                        <td><?php echo $data['updated_at'] ?></td>
					</tr>
				<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<button type="button" class="btn btn-sm btn-primary" style="display: none;" id="buttonModal" data-toggle="modal" data-target="#exampleModal"> Tambah User</button> <br/><br/>
<form action="<?php echo base_url('/admin/reaksi') ?>" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="id_darah" id="id_darah" value="">
		    <div class="form-group">
		        <label for="exampleFormControlInput1">ID Pesanan</label>
		        <input type="text" class="form-control" name="id_pesanan" id="id_pesanan" required="">
		    </div>
		    
		    
      </div>
      
    </div>
  </div>
</div>
</form>

<script>

	var url = '<?php echo base_url("/") ?>'

	function update_data(id){

		$('#buttonModal').click();
		$('#id_pesanan').val(id)

	}
</script>