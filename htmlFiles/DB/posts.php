<?php 
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);

if (isset($_POST["searchTags"]))
{   $tag = ($_POST["tags"]);
    $getTags = "select * from getPostsByTag where name = '$tag'";
    echo "<div style='padding-top: 10em;'> <p>Posts here </p></div>";
	
	$stmt = sqlsrv_query($connection, $getTags);
	if ($stmt === false){
		die(print_r(sqlsrv_errors(), true));
	}
	
	$row_count = sqlsrv_num_rows($stmt);
	if($row_count <= 0){
		echo "<div style='padding-top: 10.05em;'> <p> No results found </p> </div>";
	}else{
		while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
			echo "<br>". $row['name'] . " , ".$row['path']; 
		}
	}
    return;
} ?>