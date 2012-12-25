<?php
	require $this->resource_path.'config.php';
	
function activationuser($id) {
	if (!$id) {	
		$error .= "</br>Missing Data";
	} else {
		$sql = mysql_query("UPDATE user_account SET Activation='1' WHERE user_id='$id'"); 

		$update_activation = mysql_query("SELECT * FROM user_account WHERE user_id='$id' AND Activation='1'"); 
		$updateactivation = mysql_num_rows($update_activation); 
		if($updateactivation == 0) { 
			$error .= "</br>Caution! This account cannot be activate.";
		} elseif ($updateactivation > 0) {
			$error .= "</br>Congratulations! This account is succesfully activated."; 
		} 
	}
	return $error;
}
	
	$id = $_REQUEST['id'];
	$id = ereg_replace("[^0-9]", "", $id);
	$result = activationuser($id);
	
?>
<div style="color:red;">
		<?php echo $result;?>
	</div>
