<div class="addnewprofilediv">
<div class="addnewprofileform">
        <form class="form-horizontal" method="post">
            <h4 class="addnewprofileh4">Add a new Hate-Profile</h4>
            <div class="form-group">
                <input type="text" name="twitterHandle" class="form-control" placeholder="twitterhandle">
            </div>
            <div class="form-group">
                    <input type="text" name="firstName" class="form-control" placeholder="First Name">
            </div>
            <div class="form-group">
                    <input type="text" name="lastName" class="form-control" id="pwd" placeholder="Last Name">
            </div>
            <div class="form-group">
                <input type="text" name="job" class="form-control" id="pwd" placeholder="Job">
            </div>
            <label>Gender:</label>

            <div class="form-group">

            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio1" value="w" checked> female
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio2" value="m"> male
            </label>
            </div>
            <div class="form-group">
                <div>
                    <button type="submit" name="createProfile" class="btn btn-default">Submit</button>
                </div>
            </div>
            <!-- if not valid -> error (wenn schon exists oder kein echter twitterhandle), if valid -> weiterleiten zu post erstellen -->
        </form>
</div>
</div>

<?php
    $servername = "(LocalDb)\MSSQLLocalDB";
    $connectionInfo = array("Database" => "SocialJustice");
    $connection = sqlsrv_connect($servername, $connectionInfo);

    if(isset($_POST["createProfile"])){
        $twitterHandle = $_POST["twitterHandle"];
        $headers = get_headers("https://twitter.com/".$twitterHandle);
        if(strpos($headers[0], '404') !== false ) {
            echo "User does not exist";

        } else {
            $firstName = $_POST["firstName"];
            $lastName = $_POST["lastName"];
            $job = $_POST["job"];
            $gender = $_POST["gender"];
            $createProfile = "execute uspCreateProfile '".$twitterHandle."','". $firstName ."','".$lastName ."','".$gender."','".$job."'";
            $sendCreateProfile = sqlsrv_query($connection, $createProfile);

            if(!$sendCreateProfile){
                echo "User already inserted.";
            }
        }


    }
?>
