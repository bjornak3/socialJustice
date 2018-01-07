<?php 
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);

if (isset($_POST["searchTags"]))
{   $tag = ($_POST["tags"]);
    $getTags = "select * from getPostsByTag where name = '$tag'";
   
	$stmt = sqlsrv_query($connection, $getTags);
	if ($stmt === false){
		die(print_r(sqlsrv_errors(), true));
	}
	

		while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
			echo "<div style='padding-top: 10em;'>". $row['name'] . " ". $row['PATH']; 
			?>
			<blockquote class="twitter-tweet" data-lang="en"><p lang="und" dir="ltr"><a href="https://t.co/aSEh0URVfA">pic.twitter.com/aSEh0URVfA</a>
		
			<a href=" <?php
			echo $row['PATH'];
			$row['PATH'] ?>"></a></blockquote>
			
			<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

		<?php	
			echo "</div>";
		}
    return;
} ?>