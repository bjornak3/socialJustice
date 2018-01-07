<?php
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);
	if(isset($_POST["send"])){
		$text = $_POST["com"];
		
		$selectUsrID = "select ID from users where username = 'if16b047'";
		
		$sendID = sqlsrv_query($connection, $selectUsrID); 
		$userId = 0; 
		while($row = sqlsrv_fetch_array($sendID, SQLSRV_FETCH_ASSOC) ){
			$userId = $row['ID']; 
		}
		
		$sql = "execute addComment 5555,$userId,'$text'";
		$sendSql = sqlsrv_query($connection, $sql); 
		
		header("Location: index.php");
	}
?>