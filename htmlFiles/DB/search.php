<div class="searchdiv col-md-6 col-md-offset-3">
    <div>
        <p>search for Profiles by</p>
        <div class="input-group searchform">
            <div class="input-group-addon""><span>twitterhandles</span>
        </div>
        <input type="text" class="form-control searchbar" placeholder="type to search...">
        <div class="input-group-btn">
            <button name="searchtwitterhandles" class="btn btn-default  searchbutton" type="submit">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </div>
        <?php if (isset($_POST["searchTwitterHandles"]))
        {$twitterHandle = ($_POST["searchTwitterHandles"]);
            $getTwitterHandles = "select * from PROFILES where TWITTER_HANDLE = '$twitterHandle'";
            return;
        } ?>
    </div>
    <div style="padding-top: 2em;">
        <p>search for Posts by</p>
        <div class="input-group searchform">
            <div class="input-group-addon""><span>tags</span></div>
        <input type="text" class="form-control searchbar" placeholder="type to search...">
        <div class="input-group-btn">
            <button name="searchTags" class="btn btn-default  searchbutton" type="submit">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </div>
        <?php if (isset($_POST["searchTags"]))
        {   $tag = ($_POST["searchTags"]);
            $getTags = "select * from POST_TAG_VIEW where TAG = '$tag'";
            return;
        } ?>
    </div>
</div>