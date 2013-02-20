<?php
	require $this->resource_path.'config.php';
	require $this->resource_path.'sql_function.php';
	
	$id = $_REQUEST['id'];
	$id = ereg_replace("[^0-9]", "", $id);
	$result = activationuser($id);
	
?>
<div style="color:red;">
		<?php echo $result;?>
	</div>
