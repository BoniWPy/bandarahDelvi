<h1 class="pt-3">Laporan Reaksi Transfusi</h1>
<div class="row">
	<div class="col-sm-12 col-lg-12">
		<div class="card card-body">
			<?php echo $this->session->flashdata("alert") ?>
			<form action="" method="post">
				<div class="row">
				    <div class="col">
				    	<label>Catatan Reaksi</label>
				      	<textarea class="form-control" name="alamat"></textarea>
				    </div>
				</div>
				<hr/>
				<h4>Laporan Reaksi Transfusi</h4>
				<div class="row">
				    <div class="col">
				    	<label>Report Nomor Register</label>
						<select class="form-control darah" name="darah" required>
				      		<option>ID Transaksi</option>
				      		<?php foreach($list as $data){ ?>
				      		<option value="<?php echo $data['id_pesanan'] ?>"><?php echo $data['golongan'] ?></option>
				      		<?php } ?>
				      	</select>
				    </div>
				</div>
				<br/>
				<div class="row">
				    <div class="col detail">
				    	
				    </div>
				</div>
				
				<br/><br/>
				<div class="text-center">
					<button class="btn btn-md btn-success">Report</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

	var base_url = '<?php echo base_url("/") ?>'

	$(document).ready(function(){
		$('.darah').change(function(){
			var id_darah = $(this).val();

			var ajax_link = base_url + 'pesanan/detail/' + id_darah

			$.get(ajax_link).fail(function(xhr,code,err){
				alert(err)
			}).done(function(res){
				$('.detail').html(res)
			});
		});
	});
</script>