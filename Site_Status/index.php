<?php
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Site Status</title>
</head>

<body>
<div id="wrapper">
    <?php
		include "../template/templateheader.php";
	?>
   <div id="content_container">
		<div class="auction_container">
		<h1><img src="../template/template_image/header/site_status.png" border="0"></h1>
		
			<div class="status_box">
				<div class="status_left">How is CoinCod doing today?<br>(Date Mth Yr)
				</div>
				<div class="status_right">Well as usual running like charm.
				</div>
			</div><p>
        
		</div>
	</div>
</div><!--wrapper-->
	<?php
		include "../template/templatefooter.html";
	?>
</body>
</html>