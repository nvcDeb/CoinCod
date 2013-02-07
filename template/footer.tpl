<?php
	require $this->resource_path.'config.php';
?>
</div> <!--end div wrapper-->

<footer id="footer_wrap">
	<section class="upper_footer_wrap">
		<div class="container" align="left">
			<nav class="ul">
				<ul class="footer_nav">
					<h4>Coincod</h4>
					<li>
						<a href="<?php echo $PREFIX; ?>/about_us">About Us</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/faq">FAQ</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/career">Careers</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/feedback">Feedback</a>
					</li>
				</ul>
						
				<ul class="footer_nav">
					<h4>Other Features</h4>
					<li>
						<a href="<?php echo $PREFIX; ?>/location">Location</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/graphics">Graphics</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/site_status">Site Status</a>
					</li>
				</ul> 
               
				<ul class="footer_nav">
					<h4>Social Networks</h4>
					<li>
						<a href="">Like Us at Facebook</a>
					</li>
					<li>
						<a href="">Follow Us at Twitter</a>
					</li>
					<li>
						<a href="">Plus One at Google+</a>
					</li>
					<li>
						<a href="">Follow Us at Pinterest</a>
					</li>
					<li>
						<a href="../auction_blog">Subscribe to Our Blog</a>
					</li>
				</ul>
               
				<ul class="footer_nav">
					<h4>Legal</h4>
					<li>
						<a href="<?php echo $PREFIX; ?>/terms">Terms of Service</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/privacy">Privacy</a>
					</li>
					<li>
						<a href="<?php echo $PREFIX; ?>/security">Security</a>
					</li>
				</ul>
			</nav>  <!--end of nav ul-->
		</div>  <!--end of container-->
	</section>  <!--end of section upper_footer_wrap-->

	<section id="lower_footer_wrap">
		<div class="container">
			<div class="logo_image">
				<a href="<?php echo $PREFIX; ?>"><img src="<?php echo $PREFIX; ?>/template/template_image/logo2.png" width="80px" border="0"></a>
			</div>  <!--end div logo_image-->	
			<div class="payment_image">
				<p/><a href="#"><img src="<?php echo $PREFIX; ?>/template/template_image/payment.png" width="700" border="0"></a>
			</div>  <!--end div payment_image-->
			<div class="copyright">
				<p>Copyright &copy; 2012 NexVend Sdn Bhd. All rights reserved.</p>
			</div><!--end of copyright-->
		</div> <!--end of container-->	 
	</section><!--end  of section lower_footer_wrap-->         
	
	<!-- back2top blockcode -->
	<section id="back-top">
		<a href="#top"><span></span>Back To Top</a>
	</section><!-- end of back2top -->	
</footer><!--footer_wrap--> 		

<!-- ======================================= Lazy Loads ================================= -->
        
<!-- back2top script-->   
<script >
	$(function(){
		// hide #back-top first
		$("#back-top").hide();
		// fade in #back-top
		$(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 100) {
					$('#back-top').fadeIn();
				} else {
					$('#back-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-top a').click(function () {
				$('body,html').animate({
					scrollTop: 0
				}, 800);
				return false;
			});
		});
	});
</script><!-- end of back2top script -->

<!-- Accordion script -->
<script>
    $(function() {
        $("#menu").accordion({
            collapsible: true, 
            active: false
        });
    });
</script>
        
</body>
</html>