<div class="searchdiv col-md-6 col-md-offset-3">
    <div>
        <form  method="POST" action="index.php?section=profiles">
        <label>search for Profiles by twitterHandle</label>
        <div class="input-group searchform">
            <div class="input-group-addon"><span>twitterhandles</span>
        </div>
        <input type="text" class="form-control searchbar" name="twitterHandle" placeholder="type to search...">
        <div class="input-group-btn">
            <button name="searchTwitterHandles" class="btn btn-default  searchbutton" type="submit">
                 <i class="glyphicon glyphicon-search"></i>
            </button>

        </div>
        </form>

    </div>
    <div style="padding-top: 2em;">
        <form  method="POST" action="index.php?section=posts">
        <label>search for Posts by TAG</label>
        <div class="input-group searchform">
            <div class="input-group-addon""><span>tags</span></div>
        <input type="text" class="form-control searchbar" name="tags" placeholder="type to search...">
        <div class="input-group-btn">
            <button name="searchTags" class="btn btn-default  searchbutton" type="submit">
              <i class="glyphicon glyphicon-search"></i>
            </button>
        </div>
        </form>
    </div>
</div>