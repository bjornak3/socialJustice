<html>
<head>
</head>
<body>
<?php
	include_once('../configFiles/connectData.php');
	// check if the sql driver is loaded
	echo "<pre>";
	print_r(PDO::getAvailableDrivers());
	
	
	$connection = sqlsrv_connect($servername, $connectionInfo);
	
	if(!$connection){
		die( print_r(sqlsrv_errors(),true)); 
	}else{
		echo "Connected";
	}
?>

</body>
</head>