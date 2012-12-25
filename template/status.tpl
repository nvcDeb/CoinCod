<?php
	require '../config.php';
	
function get_sitestatus() {
	$getstatus=mysql_query("SELECT * FROM status");
	$get=mysql_fetch_array($getstatus);
	$status=$get["site_status"];
	return $status;
}
?>
<div class="status_box">
	<div class="status_left">
		<div class="left">How is CoinCod doing today?
			<?=date("d-F-Y")?>
		</div>
	</div>
	<div class="status_right">
		<div class="right">
			<?=get_sitestatus()?>
		</div>
	</div>
</div>