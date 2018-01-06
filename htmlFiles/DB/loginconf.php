<?php
if (isset($_POST["Logout"]))
{
    session_destroy();
    header("Location: index.php");
    return;
}
if (isset($_POST["Login"]))  {
    $_SESSION["Loggedin"] = "miel";
}