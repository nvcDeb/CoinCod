CoinCod
=================

Repository for the Main CoinCod WebApp


Introduction
-----------------

CoinCod is unique auction system design to bring users with the same taste together and get their dream products at a best deal. The system can easily be setup by changing config.php according to your local machine setup. A couple local server can be use to setup the system. Some recommended off the shelf packed local server such as XAMPP, WAMP or MAMP.


Setup
-----------------

Enter which ever part is appropriate for setup: 

	$hostname = 'enter your hostname';	--> if you are on local machine set hostname to 'localhost'
	$dbname = 'enter your database name';
	$username = 'enter your localhost username';
	$password = 'enter your localhost password';

Note: You can omit this step if you are running on a live server.

Inside of mainPageURL function under return $pageURL enter your folder name that stores all your coincod files. 

	function mainPageURL(){
		$pageURL = 'http';
		.
		.
		.
		.
		.
 		return $pageURL .= "/enter your folder name";
	}



