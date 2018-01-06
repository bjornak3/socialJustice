<?php

/*$loginusr = ($_POST["Username"]);
$loginpw = ($_POST["Password"]);

if(isset($_POST["Login"])) {
    if (isset($loginusr) && isset($loginpw)) {
        $result = mysqli_query($con, "SELECT * FROM user WHERE username='$loginusr'");
        while ($row = mysqli_fetch_assoc($result)) {
            $dbpw = $row["pwd"];
            if ($dbpw) $dbuser = $row["username"];
        }
        $md5loginpw = md5($loginpw);
        if ($dbpw == $md5loginpw) {
            $_SESSION["Loggedin"] = $loginusr;
            $dbloggedin = 1;
        } else {
            echo "Wrong password!";
        }
    }
}*/



    if (!isset($_SESSION["Loggedin"])) {
        ?>
        <ul class="nav navbar-nav navbar-right">
            <form class="nav navbar-nav loginform" method="post">
                <li><p>Username</p><input id="Username" type="text" name="Username" placeholder="username"></li>
                <li><p>Password</p><input id="Password" type="password" name="Password" placeholder="********"></li>
                <li>
                    <button class="btn loginbtn" type="button submit" name="Login"><span
                            class="glyphicon glyphicon-log-in"></span> Login
                    </button>
                </li>
                <li><a href="signup.php"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            </form>
        </ul>

        <?php


        }

    else
    {

        ?>
        <ul class="nav navbar-nav navbar-right">
            <form class="nav navbar-nav loginform" method="post">
                <li><p>Logged in as <?php
                            echo $_SESSION["Loggedin"];
                        ?></p></li>
                <li><button class="btn loginbtn" type="button submit" name="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</button></li>
            </form>
        </ul>

        <?php
    }
?>


