<div class="contentwrapper">
    <?php if(!isset($_GET['section']))
        {
        include ("search.php");
        return;
        }
    switch($_GET['section']) {
        case 'home':
            include ("search.php");
            break;
        case 'profiles':
            ?>
            <div>
                Profiles coming here
            </div>
            <?php
            break;
        case 'posts':
            ?>
            <div>
                Posts
            </div>
            <?php
            break;
        case 'addnewprofile':
            if (isset($_SESSION["Loggedin"])){
                include ("addnewprofile.php");
                break;
            }
            else{
                include ("notloggedin.php");
            }
            break;    }
?>
</div>