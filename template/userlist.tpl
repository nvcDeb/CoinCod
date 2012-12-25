<?php
function getUserListing()
{
	$sql = "SELECT * FROM user_account"; 
	$res = mysql_query($sql);

	$c=0;
	while ($a_row = mysql_fetch_array($res)) {
		$records[$c]["id"] = $a_row["user_id"];
		$records[$c]["email"] = $a_row["Email"];
		$records[$c]["username"] = $a_row["Username"];
		$records[$c]["date"] = $a_row["date_register"];
		$records[$c]["token"] = $a_row["Token"];
	$c++;
    }
	
	return $records;
}

$user_list = getUserListing();
for($i=0;$i<totaluser();$i++) {		
	$list_email=$user_list[$i]["email"]; 
	$list_id = $user_list[$i]["id"];
	$list_username = $user_list[$i]["username"];
	$list_date = $user_list[$i]["date"];
	$list_token = $user_list[$i]["token"];
?>
	<table border="0">
		<tr width="100">
			<td width="100"><?php echo $list_id ?></td>
			<td width="100"><?php echo $list_username ?></td>
			<td width="150"><?php echo $list_email ?></td>
			<td width="100"><?php echo $list_date ?></td>
			<td width="100"><?php echo $list_token ?></td>
		</tr>
	</table>
<?php } ?> 