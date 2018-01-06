<div class="addnewprofilediv">
<div class="addnewprofileform">
        <form class="form-horizontal" method="post">
            <h4 class="addnewprofileh4">Add a new Hate-Profile</h4>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="twitterhandle">
            </div>
            <div class="form-group">
                    <input type="text" class="form-control" placeholder="First Name">
            </div>
            <div class="form-group">
                    <input type="password" class="form-control" id="pwd" placeholder="Last Name">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="pwd" placeholder="Job">
            </div>
            <label>Gender:</label>

            <div class="form-group">

            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio1" value="option1" checked> female
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="inlineRadio2" value="option2"> male
            </label>
            </div>
            <div class="form-group">
                <div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
            <!-- if not valid -> error (wenn schon exists oder kein echter twitterhandle), if valid -> weiterleiten zu post erstellen -->
        </form>
</div>
</div>
