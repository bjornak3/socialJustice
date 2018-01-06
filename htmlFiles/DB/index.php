<?php
error_reporting(0);
session_start();
include ("loginconf.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./socialjustice.css"/>´
        <title>Social Justice</title>
        <link rel="icon" href="./socialjustice.ico">
    </head>
    <body>
        <div>
            <?php
            include ("nav.php");
            ?>
        </div>
        <div>
            <?php
            include ("content.php");
            ?>
        </div>

    </body>
</html>
    