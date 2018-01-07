<?php

    if (!isset($_SESSION["Loggedin"])) {
        ?>
        <ul class="nav navbar-nav navbar-right">
            <form class="nav navbar-nav loginform" method="post">
				
                <li><input id="Username" type="text" name="Username" placeholder="username"></li>
                <li><input id="Password" type="password" name="Password" placeholder="********"></li>
                <li>
                    <button class="btn loginbtn" type="button submit" name="Login"><span
                            class="glyphiconglyphicon-log-in"></span> Login
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
        <ul class="nav navbar-nav navbar-right ">
            <form class="nav navbar-nav loginform logoutdiv" method="post">
                <li><p>Logged in as <?php
                            echo $_SESSION["Loggedin"];
                        ?></p></li>
                <li><button class="btn loginbtn" type="button submit" name="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</button></li>
            </form>
        </ul>

        <?php
    }
?>


