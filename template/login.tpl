<?php
	ob_start();
	session_start();
	require_once '../config.php';
	require_once '../sql_function.php';
	
if(isset($_SESSION["logged"])){
	echo $redirectIn;
}
	
$echo_error=NULL;
if(isset($_POST["btnLogin"])){
	$email = mysql_real_escape_string($_POST["email"]);
	$password = mysql_real_escape_string($_POST["password"]);
	
	$error = NULL;
	if(empty($email)){
		$error .= "<li>Email Address is required";
	}
	if(empty($password)){
		$error .= "<li>Password is required";
	}
	if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
		$error .= "<li>Invalid Email!";
	}
	
	if(!empty($error)){
		$echo_error = "<div style='width:250px;color:#d50000;text-align:left;'><ul>".$error."</ul></div>";
	} else {
		if (verifyLogin($email,$password,0)) {
			$user_data = getMemberRecords($email);
			if($user_data['status'] == 0) {
				$echo_error = "<div style='color:#d50000;text-align:left;'>
								Your account has not been activate. Please go email to activate it now and enjoy the forthcoming experience that CoinCod will bring to you. Thank you.
							</div>";
			} else {
				$_SESSION['start'] = time(); 
				$_SESSION['expire'] = $_SESSION['start'] + (1 * 60) ;

///				session_register('user_id'); 
				$_SESSION['user_id'] = $user_data['id'];
///				session_register('email'); 
				$_SESSION['email'] = $email;
				//admin location
///				if($user_data['id']== 1) {
///					header("location: $PREFIX/user_profile/?id=$user_data[id]");
///				} else {
					header("location:".mainPageURL()); 
///				}
			}
		} else {
			$echo_error = "<div style='color:#d50000;text-align:left;'>
							Looks like your account cannot be found in our server. Please try again later. 
							If this problem persists kindly send us an email at <a href='mailto:support@coincod.com'>support@coincod.com.</a> Thank you.
						</div>";
		}
	}
}
?>
<?php 
	if(isset($echo_error)) {
		echo $echo_error; 
	}
	if(isset($_SESSION['error'])) {
		echo $_SESSION['error']; 
	}
?>

<form action="#" enctype="multipart/form-data" name="myForm" id="myLoginForm" method="post">
	<table cellpadding="0" cellspacing="10" class="login_page">
		<tr>
			<td class="value">
				Email
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="email" value="" class="text" id="email"  placeholder="Email" size="33" maxlength="50" tabindex="10" required >
			</td>
		</tr>
		<tr>
			<td class="value">
				Password
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password" value="" class="text" id="password" placeholder="Password" size="33" maxlength="50" tabindex="12" required >
			</td>
		</tr>
        <tr>
			<td>
				<input name="btnLogin" type="submit" class="form_button" value="Login">
			</td>
		</tr>
	</table> 
</form>