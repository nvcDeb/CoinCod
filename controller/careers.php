<?php
$data_setting = array(
	'group'	=> 'page'
);
$settings = getSettings($data_setting);

if($settings) {
	foreach($settings as $setting) {
		if($setting['key'] == 'careers') {
			$careers = $setting['value'];
		}
	}
}

$title = $lang['head_careers'];
?>
<h5><?php echo $lang['head_careers']; ?></h5>
<article class="auction_container">
	<?php echo $careers; ?>
	<img class="bottom" src="includes/images/bottom/careers.png" alt="careers">
</article>