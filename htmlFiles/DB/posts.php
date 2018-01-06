<?php if (isset($_POST["searchTags"]))
{   $tag = ($_POST["searchTags"]);
    $getTags = "select * from POST_TAG_VIEW where TAG = '$tag'";
    echo "<div style='padding-top: 10em;'> <p>Posts here </p></div>";
    return;
} ?>