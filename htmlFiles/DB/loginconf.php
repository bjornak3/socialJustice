<?php
if (isset($_POST["Logout"]))
{
	$username = $_SESSION['Loggedin'];
    session_destroy();
	$servername = "(LocalDb)\MSSQLLocalDB";
	$connectionInfo = array("Database"=>"SocialJustice");
	$connection = sqlsrv_connect($servername, $connectionInfo);	
	$date = date_create();
				$time = date_timestamp_get($date);
				$saveDate = date('Y-m-d H:i:s', $time);
				$sql = "execute uspLogInfo '$saveDate', '$username', 'LOGOUT'";
				$sendSql = sqlsrv_query($connection, $sql); 
    header("Location: index.php");
    return;
}
	$servername = "(LocalDb)\MSSQLLocalDB";
	$connectionInfo = array("Database"=>"SocialJustice");
	$connection = sqlsrv_connect($servername, $connectionInfo);	
	
	$username = $_POST['Username'];
	$password = $_POST['Password'];
 
if (isset($_POST["Login"]))  {
	
	if(isset($username) && isset($password)){
		$selectUsr = "select USERNAME, password from USERS where USERNAME = '$username'";
		
		$stmt = sqlsrv_query($connection, $selectUsr); 
		
		if(!$stmt){
			die();
		}
		while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
			
			$pwd = $row['password'];
			if($pwd == md5($password)){
				$date = date_create();
				$time = date_timestamp_get($date);
				$saveDate = date('Y-m-d H:i:s', $time);
				$sql = "execute uspLogInfo '$saveDate', '$username', 'LOGIN'";
				$sendSql = sqlsrv_query($connection, $sql); 
				$_SESSION['Loggedin'] = $username;
			}
		}
		
	}
}