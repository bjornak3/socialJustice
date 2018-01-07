<!DOCTYPE HTML>
<head>
    <meta charset="utf-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./socialjustice.css"/>´
    <title>Sign Up</title>
    <link rel="icon" href="./socialjustice.ico">
</head>

<body>

            <?php

			$servername = "(LocalDb)\MSSQLLocalDB";
			$connectionInfo = array("Database"=>"SocialJustice");
			$connection = sqlsrv_connect($servername, $connectionInfo);	
            
			if (isset($_POST['Register']))
            {
			$username = ($_POST["username"]);
			$password = md5($_POST["pwd"]);
			
			
			$signUp = "execute signUp '" .$username. "','".$password."';";
		
			$stmt = sqlsrv_query($connection, $signUp);
			
           
                if ($stmt)
                {
                    echo '<div style="width:50%; margin: auto;" class="alert alert-success">
						<strong> User successfully registered. </strong>
					</div> ';

                }else {
                  echo '<div style="width:50%; margin: auto;" class="alert alert-danger">
					<strong>User already exists!</strong>
				  </div>';
                }
			}
            ?>

<div class="contentwrapper">
    <div class="signupdiv">
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="username">What do you want to be called?</label>
                    <div>
                        <input type="text" name="username" class="form-control" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwd">Please choose a Password</label>
                    <div>
                        <input type="password" class="form-control" name="pwd" placeholder="Enter password">
                    </div>
                </div>
                <div class="form-group" style="float:left;">
                    <div>
                        <button type="submit" name="Register" class="btn btn-default">Sign Up!</button>
                    </div>
                </div>
                <!-- if username vergeben error-->


                <div class="form-group" style="float:right;">
            <a href="index.php">Main Page</a>
                </div>
        </form>
    </div>
</div>

</body>

</html>
