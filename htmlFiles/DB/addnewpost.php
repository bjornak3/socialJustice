<div class="addnewprofilediv">
    <div class="addnewprofileform">
        <form class="form-horizontal" method="post">
            <h4 class="addnewprofileh4">Add a new Hate-Post</h4>
            <div class="form-group">
                <input type="text" name="tweet" class="form-control" placeholder="paste link of tweet here">
            </div>
            <label>Choose a Tag</label>

            <div class="form-group">
            <label class="radio-inline">
                <input type="radio" name="tag" id="inlineRadio1" value="ethnicity" checked> ethnicity
            </label>
            <label class="radio-inline">
                <input type="radio" name="tag" id="inlineRadio2" value="sexism"> sexism
            </label>
                <label class="radio-inline">
                    <input type="radio" name="tag" id="inlineRadio2" value="disability"> disability
                </label>
                <br>
                <label class="radio-inline">
                    <input type="radio" name="tag" id="inlineRadio2" value="language"> language
                </label><label class="radio-inline">
                    <input type="radio" name="tag" id="inlineRadio2" value="nationality"> nationality
                </label>
            </div>
            <div class="form-group">
                <div>
                    <button type="submit" name="addPost" class="btn btn-default">Submit</button>
                </div>
            </div>
            <!-- if not valid -> error (wenn tweet link falsch) -->
        </form>
    </div>
</div>

<?php
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database"=>"SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);
    if(isset($_POST["addPost"])){
        $path = $_POST["tweet"];
        $tag = $_POST["tag"];
        $headers = get_headers($path);
        if (strpos($headers[0], '404') !== true) {

            $arr = preg_split("/(com\/*)/", $path);
            $arr = preg_split("/(\/s*)/", $arr[1]);

            $tweeter = strtolower($arr[0]);

            $checkTweeter = "select * from PROFILES where TWITTER_HANDLE = '$tweeter'";
            $sendCheckTweeter = sqlsrv_query($connection, $checkTweeter);
            $exists = false;
            while ($row = sqlsrv_fetch_array($sendCheckTweeter, SQLSRV_FETCH_ASSOC)) {
                $exists = true;
            }
            if ($exists == true) {

                $addPost = "execute uspAddNewPost '$path', '$tweeter', '$tag'";
                $sendAddPost = sqlsrv_query($connection, $addPost);
                if ($sendAddPost) {
                    echo "Post successfully added. ";
                } else {
                    echo "Post already exists.";
                }
            } else {
                echo "Profile is not saved in the database. Please create a profile. ";
            }
        }else{
            echo "False tweeter link";
        }
    }
?>
