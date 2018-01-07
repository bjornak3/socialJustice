<?php
if (isset($_POST["Logout"]))
{
    session_destroy();
    header("Location: index.php");
    return;
}
	$servername = "(LocalDb)\MSSQLLocalDB";
	$connectionInfo = array("Database"=>"SocialJustice");
	$connection = sqlsrv_connect($servername, $connectionInfo);	
	
	$username = $_POST['Username'];
	$password = $_POST['Password'];
	$loginError = false; 
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
				$_SESSION['Loggedin'] = $username;
			}else{
				$loginError = true; 
			}
		}
		
	}
}