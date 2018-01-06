<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand <?php if($_GET["section"] == "home") echo "active" ?>" href="index.php?section=home">Social Justice</a>
        </div>
        <?php
        if (isset($_SESSION["Loggedin"])) { ?>
            <ul class="nav navbar-nav <?php if($_GET["section"] == "addnewprofile") echo "active" ?>">
                <li><a href="index.php?section=addnewprofile">add new Hate-Profile</a></li>
            </ul>

            <?php
        }
        include ("login.php");
        ?>

    </div>
</nav>