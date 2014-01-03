<?php
if(!isset($logged)) {
	header('Location:login.html');
}

if (!hasPermission($logged, 'access', 'graphics_form')) {
	header('Location:permission.html');
}

$graphics_id = $_GET['graphics_id'];
$info = getGraphicsById($graphics_id);
$name = $info['name'];
$image = $info['image'];

if($_SERVER['REQUEST_METHOD'] == 'POST') {
	$action = $_POST['action'];
	$name = $_POST['name'];
	$graphics_id = $_POST['graphics_id'];
	$image = $_POST['file_image'];
	
	if (empty($error)) {
		if($action == "insert") {
			$insert_data = array (
				'name'			=> $name,
				'image'			=> $image
			);
			$insert_query = insertGraphics($insert_data);
			if($insert_query) {
				$_SESSION['success'] = $lang['success_insert'];
				header('Location:graphics.html');
			} else {
				$error_warning = $lang['error_query'];
			}
		} else if ($action == "update") {
			$edit_data = array (
				'graphicsId'	=> $graphics_id,
				'name'			=> $name,
				'image'			=> $image
			);
			
			$edit_query = editGraphics($edit_data);
			if($edit_query) {
				$_SESSION['success'] = $lang['success_edit'];
				header('Location:graphics.html');
			} else {
				$error_warning = $lang['error_query'];
			}
		}
	}
}
?>

<div id="content">
	<div class="breadcrumb">
		<a href="home.html"><?php echo $lang['text_home']; ?></a>
		&nbsp; > &nbsp; 
		<a href="graphics.html"><?php echo $lang['text_graphics']; ?></a>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="includes/images/category.png" alt="" /> <?php echo $lang['heading_graphics']; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $lang['button_save']; ?></a>
				<a onclick="location = 'product.html'" class="button"><?php echo $lang['button_cancel']; ?></a>
			</div>
		</div>
		<div class="content">
			<form action="graphics_form.html" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td><span class="required">*</span> <?php echo $lang['entry_name']; ?></td>
						<td><input type="text" value="<?php echo $name; ?>" name="name" placeholder="<?php echo $lang['entry_name']; ?>" /></td>
					</tr>
					<tr>
						<td><span class="required">*</span> <?php echo $lang['entry_image']; ?></td>
						<td id="product_image">
							<div id="queue"></div>
							<input id="file_upload" name="file_upload" type="file" multiple="true">
							<div id="thumbnails">
								<?php 
									$row = 0;
									$folder = 'data/image/graphics/';
									if($image != "") { 
										echo '<div class="image" id="image">
												<input type="hidden" id="hidden" name="file_image[]" value="' . $image . '" />
												<img id="thumb" src="../' . $folder . $image .'" " width="100px" height="100px" />
												<br/><center><a id="remove"">' . $lang['button_remove'] . '</a></center>
												</div>';
									} 
								?>
							</div>
							
							<script type="text/javascript">
								<?php $timestamp = time();?>
								$(function() {
									var queue_id = 0;
									var folder = 'data/image/graphics/';
									$('#file_upload').uploadifive({
										'buttonText'	: '<?php echo $lang['button_add_image']; ?>',
										'auto'			: true,
										'multi'        : false,
										'checkScript'	: 'includes/js/uploadifive/check-exists.php',
										'formData'		: {
											'upload_dir' : folder,
											'timestamp' : '<?php echo $timestamp;?>',
											'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
										}, 
										'uploadScript'	: 'includes/js/uploadifive/uploadifive.php',
										'uploadLimit'	: 1,
										'onUploadComplete' : function(file, data) { 
											console.log(data);
											$('#thumbnails').append('<div class="image" id="image' + queue_id + '">' +
																'<input type="hidden" id="hidden' + queue_id + '" name="file_image[]" value="'+ file.name +'" />' +
																'<img id="thumb'+ queue_id+'" src="../' + folder + file.name +'" width="100px" height="100px" />'+
																'<br/><center><a id="remove"><?php echo $lang['button_remove']; ?></a></center>' +
																'</div>');
										},
										'onSelect' : function(queue) {
											queue_id = queue.count;
										}
									});
								});
							</script>
						</td>
					</tr>
				</table>
				<?php if($graphics_id) { ?>
					<input type="hidden" name="action" value="update" />
					<input type="hidden" name="graphics_id" value="<?php echo $graphics_id; ?>" />
				<?php } else { ?>
					<input type="hidden" name="action" value="insert" />
				<?php } ?>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#remove").live('click', function(){
		$(this).parent().parent().remove();
	});
});
</script>