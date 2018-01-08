
<?php
$servername = "(LocalDb)\MSSQLLocalDB";
$connectionInfo = array("Database" => "SocialJustice");
$connection = sqlsrv_connect($servername, $connectionInfo);
if (isset($_GET["send"])) {
    $text = $_GET["com"];
    $user = $_GET["user"];

    $postID = $_GET["postID"];

    $selectUsrID = "select ID from users where username = '" . $user . "'";

    $sendID = sqlsrv_query($connection, $selectUsrID);
    $userId = 0;
    while ($row = sqlsrv_fetch_array($sendID, SQLSRV_FETCH_ASSOC)) {
        $userId = $row['ID'];
    }

    $sql = "execute addComment " . $postID . ",$userId,'$text'";
    $sendSql = sqlsrv_query($connection, $sql);

    header("Location: index.php");
}
?>