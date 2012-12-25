<?php
	require $this->resource_path.'config.php';
function getTopBidder()
{
	$sql = "SELECT * FROM product_log WHERE auction_price=(select max(auction_price) from product_log)"; 
	$res = mysql_query($sql);
	$records = mysql_fetch_array($res);
	$highest_user=$records["Username"];
	return $highest_user;
}
function getTotalProduct()
{
	$sql = "SELECT * FROM product_list"; 
	$res = mysql_query($sql);
	$records = mysql_num_rows($res);
	return $records;
}
function getProductList()
{
	$sql = "SELECT * FROM product_list"; 
	$res = mysql_query($sql);

	$c=0;
	while ($a_row = mysql_fetch_array($res)) {
		$records[$c]["pid"] = $a_row["product_id"];
		$records[$c]["brand"] = $a_row["Brand"];
		$records[$c]["model"] = $a_row["Model"];
		$records[$c]["mprice"] = $a_row["market_price"];
		$records[$c]["aprice"] = $a_row["auction_price"];
		$records[$c]["category"] = $a_row["Category"];
		$records[$c]["availablity"] = $a_row["Availability"];
		$records[$c]["description"] = $a_row["Description"];
		$records[$c]["bid"] = $a_row["total_bid"];
		$records[$c]["astart"] = $a_row["auction_start"];
		$records[$c]["aend"] = $a_row["auction_end"];
	$c++;
    }
	
	return $records;
}
?>
<section class="site_body">
<?php
	$highest_bidder = getTopBidder();
	$totalproduct = getTotalProduct();
	if($totalproduct > 0) {
		$product = getProductList();
		for($i=0;$i<$totalproduct;$i++) {		
			$pro_id=$product[$i]["pid"]; 
			$pro_brand = $product[$i]["brand"];
			$pro_model = $product[$i]["model"];
			$pro_mprice = $product[$i]["mprice"];
			$pro_aprice = $product[$i]["aprice"];
	//		$pro_category =$product[$i]["category"]; 
	//		$pro_availability = $product[$i]["availability"];
	//		$pro_description = $product[$i]["description"];
			$pro_bid = $product[$i]["bid"];
	//		$pro_astart = $product[$i]["astart"];
			
			$pro_aend = $product[$i]["aend"];	
			$auctiontime = $pro_aend - time();
			
			if($pro_bid <= 200)									{	$tokenneed = 1;		}
			if(($pro_bid <= 400)	&&	($pro_bid > 200))		{	$tokenneed = 2;		}
			if(($pro_bid <= 600)	&&	($pro_bid > 400))		{	$tokenneed = 3;		}
			if(($pro_bid <= 800)	&&	($pro_bid > 600))		{	$tokenneed = 4;		}
			if(($pro_bid <= 1000)	&&	($pro_bid > 800))		{	$tokenneed = 5;		}
			if(($pro_bid <= 1200)	&&	($pro_bid > 1000))		{	$tokenneed = 6;		}
			if(($pro_bid <= 1400)	&&	($pro_bid > 1200))		{	$tokenneed = 7;		}
			if(($pro_bid <= 1600)	&&	($pro_bid > 1400))		{	$tokenneed = 8;		}
			if(($pro_bid <= 1800)	&&	($pro_bid > 1600))		{	$tokenneed = 9;		}
			if(($pro_bid <= 2000)	&&	($pro_bid > 1800))		{	$tokenneed = 10;	}
			if(($pro_bid <= 2200)	&&	($pro_bid > 2000))		{	$tokenneed = 11;	}
			if(($pro_bid <= 2400)	&&	($pro_bid > 2200))		{	$tokenneed = 12;	}
			if(($pro_bid <= 2600)	&&	($pro_bid > 2400))		{	$tokenneed = 13;	}
			if(($pro_bid <= 2800)	&&	($pro_bid > 2600))		{	$tokenneed = 14;	}
			if(($pro_bid <= 3000)	&&	($pro_bid > 2800))		{	$tokenneed = 15;	}
			if(($pro_bid <= 3200)	&&	($pro_bid > 3000))		{	$tokenneed = 16;	}
			if(($pro_bid <= 3400)	&&	($pro_bid > 3200))		{	$tokenneed = 17;	}
			if(($pro_bid <= 3600)	&&	($pro_bid > 3400))		{	$tokenneed = 18;	}
			if(($pro_bid <= 3800)	&&	($pro_bid > 3600))		{	$tokenneed = 19;	}
			if(($pro_bid <= 4000)	&&	($pro_bid > 3800))		{	$tokenneed = 20;	}
			if($pro_bid > 4000)									{	$tokenneed = 25;	}
?>
			<script>
				Timer[<?=$pro_id?>] = <?=$auctiontime?>;
			</script>
			<ul id="auction_list_ul" class="auction_box">
				<li>
					<div class="title">
						<form id="myForm" name="postlink" action="<?=$PREFIX?>/product/product_description.php" method="post">
							<input type="hidden" name="pid" value='<?=$pro_id?>' />
							<input name="link"  class="button_title" type="submit" value="<?=$pro_brand.$pro_model?>" />	
						</form>
					</div>
					
					<div class="image">
						<form id="myForm" name="postlink" action="<?=$PREFIX?>/product/product_description.php" method="post">
							<input type="hidden" name="pid" value='<?=$pro_id?>' />
							<input type="image" src="<?=$PREFIX?>/product/product_image/<?=$pro_id?>.jpg" width="210" height="150" input name="link" type="submit" value="<?=$pro_brand.$pro_model?>" />				  	
						</form>
					</div>
					
					<div class="bid_current">
						Current Auction Price:
						<div class="bid_current_color">
							RM <?=$pro_aprice?>
				  		</div>
					</div>
					
					<div class="bid_box">
						<div id="bid_timer_<?=$pro_id?>" class="bid_timer" end_time="">
							<?=$auctiontime?>
						</div>
						<!--<div id="bid_price_1" class="bid_price">'.$Marketprice.'</div>-->
						<?php if(!isset($_SESSION['user_id'])) { ?>
							<form action="<?=$PREFIX?>/login" method="post">
								<div class="bid_button">
									<input name="login"  class="button" type="submit" value="LOGIN" />
								</div>
							</form>
						<?php } else { 
							$userid = $_SESSION['user_id'];
							if($userid == 1 && $auctiontime >0) { ?>
								<form action="<?=$PREFIX?>/admin_site/product_info.php" method="post">
							  		<input type="hidden" name="uid" value='<?=$userid?>' />
							  		<input type="hidden" name="pid" value='<?=$pro_id?>' />
						 	  		<div class="bid_button">
										<input name="bid<?=$pro_id?>"  class="button" type="submit" value="Edit"/>
						      		</div>
								</form>
							<?php } else if($userid == 1 && $auctiontime <0) { ?>
								<form action="<?=$PREFIX?>/admin_site/product_info.php" method="post">
							  		<input type="hidden" name="uid" value='<?=$userid?>' />
							  		<input type="hidden" name="pid" value='<?=$pro_id?>' />
						 	  		<div class="bid_button">
										<input name="bid<?=$pro_id?>"  class="button" type="submit" value="Edit"/>
										<input name="endbid<?=$pro_id?>" class="button" type="submit" value="End Bid" />
						      		</div>
								</form>
							<?php } else if($userid > 0 && $auctiontime >0) { ?>
								<form action="<?=$PREFIX?>/Function/updatetimer.php" method="post">
							  		<input type="hidden" name="uid" value='<?=$userid?>' />
							  		<input type="hidden" name="pid" value='<?$pro_id?>' />
						 	  		<div class="bid_button">
										<input name="bid<?=$pro_id?>"  class="button" type="submit" value="<?=$tokenneed?> Token to BID" />
						      		</div>
								</form>
							<?php } else if($userid > 0 && $auctiontime <0) { ?>
								<div class="bid_button">
						      		<input name="endbid<?=$pro_id?>" class="button" type="submit" value="Bid Ended" />
						        </div>
							<?php }
						} ?>
						
						<div id="read_more">						
							<form id="myForm" name="postlink" action="<?=$PREFIX?>/product/product_description.php" method="post">
								<input type="hidden" name="pid" value='<?=$pro_id?>' />
								<input name="link"  class="read_more" type="submit" value="Read More..." />	
							</form>
						</div>
						
						<span class="bid_spot">
							Highest Bidder<?=$highest_bidder?> 
							<!--This is the spot for you to put the bid function<div>Bid<div>-->
                    	</span>
						<span id="auto_bidder">
							Auto Bidder</br>
						</span>	
					</div>
				</li>
			</ul>
<?php
		}
	} else {
		echo "no data";
	}
?>
</section>