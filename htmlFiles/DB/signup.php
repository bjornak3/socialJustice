<!DOCTYPE HTML>
<html  lang="en">
<head>
    <meta charset="utf-8">
    <link href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"><!--bootstrap template-->
    <link rel="stylesheet" type="text/css" href="./css/webshop.css" />
    <link rel="icon" href="./bilder/bubble.ico">
    <title>Registration</title>
    <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>


<div class="content2">
    <div class="logdiv2">
        <form method="post">
            Surname:</br>
            <input id="Surname" type="text" name="Surname" placeholder="Max"></br>
            LastName:</br>
            <input id="LastName" type="text" name="LastName" placeholder="Muster"></br>
            Username:</br>
            <input id="Username" type="text" name="Username" placeholder="maxmuster123"></br>
            Password:</br>
            <input id="Password" type="password" name="Password" placeholder="********"></br>
            E-Mail:</br>
            <input id="Email" type="email" name="Email" placeholder="max@muster.com"></br>
            <br/>
            <button type="button submit" name="Register" class="btn btn-primary center-block">Register</button>
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
            <a href="index.php">Main Page</a>
        </form>
    </div>
</div>

</body>

</html>
