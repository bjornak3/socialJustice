<?php if (isset($_POST["searchTwitterHandles"]))
{
    $twitterHandle = ($_POST["searchTwitterHandles"]);
    $getTwitterHandles = "select * from PROFILES where TWITTER_HANDLE = '$twitterHandle'";
    echo "<div style='padding-top: 10em;'> <p>Profiles here </p></div>";
    return;
} ?>