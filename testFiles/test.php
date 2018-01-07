<html>
<head>
</head>
<body>
<?php
	include_once('../configFiles/connectData.php');
	// check if the sql driver is loaded
	echo "<pre>";
	//print_r(PDO::getAvailableDrivers());
	
	$connection = sqlsrv_connect($servername, $connectionInfo);
	
	if(!$connection){
		die( print_r(sqlsrv_errors(),true)); 
	}else{
		echo "Connected";
	}
	
	// simple select query
	
	$sql = "select * from HATE_LVL";
	$stmt = sqlsrv_query($connection, $sql);
	if ($stmt === false){
		die(print_r(sqlsrv_errors(), true));
	}
	
	while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
		echo "<br>". $row['ID'] . " , ".$row['NAME']; 
	}
	
	// execute a stored procedure
	$anweisung = sqlsrv_query($connection, "execute uspCreateUser 'helo'");
	if($anweisung === true){
		echo "success";
	}else{
		die(print_r(sqlsrv_errors(), true)); 
	}
?>

</body>
</head>