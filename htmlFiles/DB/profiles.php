<?php 
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);

if (isset($_POST["searchTwitterHandles"])){
    $twitterHandle = ($_POST["twitterHandle"]);

    $getTwitterHandles = "select profiles.VORNAME, profiles.NACHNAME, profiles.GESCHLECHT, PROFILES.job, HATE_LVL.NAME, profiles.twitter_handle from profiles, HATE_LVL
where TWITTER_HANDLE = '$twitterHandle' and HATE_LVL.ID = (select PROFILES.FK_HATE_ID from PROFILES where TWITTER_HANDLE = '$twitterHandle');";
	
  $stmt = sqlsrv_query($connection, $getTwitterHandles);
	if ($stmt === false){
 	
		die(print_r(sqlsrv_errors(), true));
	}

		while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
		echo "<div style='padding-top: 10em;'>
			". $row['VORNAME'] . " " . $row['NACHNAME'] . " (".$row['twitter_handle'] .") <br>
			Image: <img src = 'https://twitter.com/$twitterHandle/profile_image?size=original'> <br> Job: " 
			. $row['job'] ."<br>Geschlecht: " . $row['GESCHLECHT']. " <br> Hate_Level: " . $row['NAME'];
		}
	
    return;
} 
?>