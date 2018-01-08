<?php 

$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);
$user = $_SESSION['Loggedin'];
if (isset($_POST["searchTags"]))
{   $tag = ($_POST["tags"]);
    $getTags = "select * from getPostsByTag where name = '$tag'";
   
	$stmt = sqlsrv_query($connection, $getTags);
	if ($stmt === false){
		die(print_r(sqlsrv_errors(), true));
	}
	

		while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ){
			echo "<div style='padding-top:10em;margin-left:30%;'>". $row['name'] . " ". $row['PATH']; 
			?>
			<blockquote class="twitter-tweet" data-lang="en"><p lang="und" dir="ltr"><a href="https://t.co/aSEh0URVfA">pic.twitter.com/aSEh0URVfA</a>
		
			<a href=" <?php
			echo $row['PATH'];
			$row['PATH'] ?>"></a></blockquote>
			
			<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

		<?php	
		
		$getComments = "select username, text, posts.ID from comments join users on users.ID = FK_USERS
							join posts on FK_POST = posts.ID where posts.PATH = '".$row['PATH']."'";
			$sendSQLgetComment = sqlsrv_query($connection, $getComments);
		    $postID;
			while($getRow = sqlsrv_fetch_array($sendSQLgetComment, SQLSRV_FETCH_ASSOC)){
			    $postID = $getRow['ID'];
				echo $getRow['username'] . " said: " . $getRow['text'] . "<br>";
			}

            if (isset($_SESSION['Loggedin'])) { ?>

                <form class="form-horizontal" method="GET" action="addComment.php">
                    <div class="form-group">
                        <label for="comment">Add your comment</label>
                        <div>
                            <input style="width:auto;" type="text" name="com" class="form-control" placeholder="Comment">

                        </div>
                    </div>
                    <input  name="postID" value="<?php echo $postID ?>" type="hidden">
                    <input type="hidden" name="user" value="<?php echo $user ?>">
                    <div class="form-group">
                        <div>
                            <button type="submit" name="send" class="btn btn-default">Add Comment</button>
                        </div>
                    </div>
                </form>
                <?php



            }
			echo "</div>";
		}
    return;
} ?>