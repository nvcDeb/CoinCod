<?php
	require $this->resource_path.'config.php';
?>
<html>
<head>
    <title><?php echo $this->eprint($this->title); ?></title>
	<meta charset="utf-8" />
    <meta name="description" content="<?php echo $this->eprint($this->meta_description); ?>" />
    <!-- Le Styles -->
	<link href="<?php $this ->eprint($this->template_path)?>style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="<?php echo $PREFIX; ?>/validation/css/validation.css" type="text/css" />
	<!--[if lte IE 9]>
	<link href="<?php $this ->eprint($this->template_path)?>style_ie.css" rel="stylesheet" type="text/css"  />
	<![endif]-->
	
	<!-- Le Javascript -->
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <script type="text/javascript" src="<?php echo $PREFIX; ?>/validation/livevalidation_standalone.compressed.js"></script>

	<!-- favicon -->
	<link rel="shortcut icon" href="template/template_image/favicon.ico" />
	
	<!-- Countdown Script -->    
	<script type="text/javascript">  
  		window.setTimeout("Tick()", 1000);  
		var Timer = {};
  
		function Tick() {
    		UpdateTimer();
    		window.setTimeout("Tick()", 1000);
		}

		function UpdateTimer() {
			var eta;
			for ( var i in Timer ) {
				eta = Timer[i];
				//eta = "00:" + LeadingZero(Timer[i]);
				document.getElementById("bid_timer_" + i).innerHTML = ( (eta <= 0) ? 0 : eta );
				Timer[i] -= 1;
			}
		}

		function LeadingZero(Time) {  
    		return (Time < 10) ? "0" + Time : + Time;  
		}
	</script>    
</head>

<body>
<div id="wrapper">
	<header id="header">
		<div id="header_content">
			<div class="container">
				<div class="login_head">
					<?php echo $this->login; ?>
				</div> <!--end div login_head-->
						
				<div id="logo">
					<a href="<?php echo $PREFIX; ?>"></a>
				</div>  <!--end div logo-->
						
				<nav class="menu">
					<table cellspacing="0">
						<tbody>
							<tr>
								<td>
									<ul class="top_nav logged_out">
										<li>
											<a href="<?php echo $PREFIX; ?>">Home</a>
										</li>
										<li>
											<a href="<?php echo $PREFIX; ?>/how_it_works">How It Works</a>
										</li>
										<li>
											<a href="<?php echo $PREFIX; ?>/buy_tokens">Buy Tokens</a>
										</li>
										<!--<li>
											<a href="header/winners">Winners</a>			
										</li>-->					
									</ul>
								</td>
							</tr>
						</tbody>
					</table> 		
				</nav>  <!--end div menu-->

				<div id="search"> 
					<form action="<?php echo $PREFIX; ?>/search" enctype="multipart/form-data" name="searchForm" id="myForm" method="GET">
						<input type="text" class="search_input" name="search" placeholder="Enter Search..." value="<?php echo isset($searchTerms)?htmlspecialchars($searchTerms):''; ?>" />
					</form>
				</div>  <!--end div search-->
			</div> <!--end div container-->
		</div> <!--end div header_content-->
	</header> <!--end header-->