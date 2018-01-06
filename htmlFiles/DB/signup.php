<!DOCTYPE HTML>
<head>
    <meta charset="utf-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./socialjustice.css"/>´
    <title>Sign Up</title>
    <link rel="icon" href="./socialjustice.ico">
</head>

<body>


<div class="contentwrapper">
    <div class="signupdiv">
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="email">What do you want to be called?</label>
                    <div>
                        <input type="text" class="form-control" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwd">Please choose a Password</label>
                    <div>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password">
                    </div>
                </div>
                <div class="form-group" style="float:left;">
                    <div>
                        <button type="submit" class="btn btn-default">Sign Up!</button>
                    </div>
                </div>


            <?php

            if (isset($_POST['Register']))
            {
                $pwd_hash = md5($_POST['Password']);

                $sql = "INSERT INTO user (username, pwd, vorname, nachname, email, is_admin, is_ldap) VALUES
                                          ('".$_POST['Username']."','".$pwd_hash."','".$_POST['Surname']."','".$_POST['LastName']."','".$_POST['Email']."',false,false)";
                $registered = $con->query($sql);
            }

            if (isset ($_POST['Register']))
            {
                if ($registered)
                {
                    echo "User was registered succesfully!";

                }else {
                    echo "User already exists.";
                }
            }
            ?>
                <div class="form-group" style="float:right;">
            <a href="index.php">Main Page</a>
                </div>
        </form>
    </div>
</div>

</body>

</html>
