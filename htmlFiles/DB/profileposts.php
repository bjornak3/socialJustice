<?php
	$servername = "(LocalDb)\MSSQLLocalDB";
	$connectionInfo = array("Database"=>"SocialJustice");
	$connection = sqlsrv_connect($servername, $connectionInfo);
	
	$getPostsbyTwitterhandle = "select POSTS.PATH, PROFILES.TWITTER_HANDLE from POSTS 
			join PROFILES on PROFILES.ID = POSTS.FK_PROFILES  where TWITTER_HANDLE = 'realdonaldtrump';";
	
		$newStmt = sqlsrv_query($connection, $getPostsbyTwitterHandle);
		
				
		echo "<div> POSTS: </div>" . $getPostsbyTwitterhandle; 
		
		while($rows = sqlsrv_fetch_array($newStmt, SQLSRV_FETCH_ASSOC)){
			echo "<div>". $rows['PATH'];
		}

?>