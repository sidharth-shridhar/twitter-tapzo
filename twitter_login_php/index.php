<?php
//start session

session_start();
//error_reporting(0);
//Include Twitter config file && User class
include 'twConfig.php';
include 'User.php';
 $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "twitter_feed";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
//function mysql_escape_string($string){return ;}
//If OAuth token not matched
if(isset($_REQUEST['oauth_token']) && $_SESSION['token'] !== $_REQUEST['oauth_token']){
    //Remove token from session
    unset($_SESSION['token']);
    unset($_SESSION['token_secret']);
}

//If user already verified 
if(isset($_SESSION['status']) && $_SESSION['status'] == 'verified' && !empty($_SESSION['request_vars'])){
    //Retrive variables from session
    $username         = $_SESSION['request_vars']['screen_name'];
    $twitterId        = $_SESSION['request_vars']['user_id'];
    $oauthToken       = $_SESSION['request_vars']['oauth_token'];
    $oauthTokenSecret = $_SESSION['request_vars']['oauth_token_secret'];
    $profilePicture   = $_SESSION['userData']['picture'];
    
    /*
     * Prepare output to show to the user
     */
    $twClient = new TwitterOAuth($consumerKey, $consumerSecret, $oauthToken, $oauthTokenSecret);
    
    //If user submits a tweet to post to twitter
    
    $output = '<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tapzo|Dashboard</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
</head>';
    $output .= '<header>
        <nav class="navbar navbar-expand-lg navbar-dark mdb-color darken-4">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#"><i class="fa fa-twitter fa-lg"></i></a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="#">Dashboard</a>
            </li>
           

        </ul>';
        $output .= '    <ul class="navbar-nav ml-auto nav-flex-icons">
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light">Hi, <span id="userid">'.$username.'</span></a>
                        </li>
                        <li class="nav-item avatar dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="'.$profilePicture.'" class="img-fluid rounded-circle z-depth-0" width="30"></a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-purple" aria-labelledby="navbarDropdownMenuLink-5">
                                <a class="dropdown-item" href="logout.php">Sign out<i class="fa-li fa fa-sign-out"></i></a>
                            
                            </div>
                        </li>
                    </ul>
    </div>
    </nav>
    </header>
    '; 
    //Display username and logout link
 
    
    //Get latest tweets
   
   //$output .= '<br><br><div class="tweet_list"><strong>Followers : </strong>';
    //$output .= '<ul>';
    $profiles = array();
// Get the ids of all followers.
$ids = $twClient->get('friends/ids');
// Chunk the ids in to arrays of 100.
    $ids_arrays = array_chunk($ids->ids, 100);
// Loop through each array of 100 ids.
    $k = 0;
foreach($ids_arrays as $implode) {
    
  // Perform a lookup for each chunk of 100 ids.
  $results = $twClient->get('users/lookup', array('user_id' => implode(',', $implode)));
  // Loop through each profile result.
  foreach($results as $profile) {
    if($k<=600)
    {
    // Use screen_name as key for $profiles array.
        $k++;
    $profiles[$profile->screen_name] = $profile;
    $reg_exUrl = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";
    $text = addslashes($profile->status->text);
    $created = $profile->status->created_at;
    $texta = explode(" ", $created);
    $textb = explode(":", $texta[3]);
    $t_val = ((int)$textb[0]*60*60)+((int)$textb[1]*60)+(int)$textb[2]+((int)$texta[2]*60*60*24)+((int)$texta[5]*60*60*24*365);
    switch($texta[1])
    {
        case 'Jan': $t_val += (1*30*24*60*60);
                    break;
        case 'Feb': $t_val += (2*30*24*60*60);
                    break;
        case 'Mar': $t_val += (3*30*24*60*60);
                    break;
        case 'Apr': $t_val += (4*30*24*60*60);
                    break;
        case 'May': $t_val += (5*30*24*60*60);
                    break;
        case 'Jun': $t_val += (6*30*24*60*60);
                    break;
        case 'Jul': $t_val += (7*30*24*60*60);
                    break;
        case 'Aug': $t_val += (8*30*24*60*60);
                    break;
        case 'Sep': $t_val += (9*30*24*60*60);
                    break;
        case 'Oct': $t_val += (10*30*24*60*60);
                    break;
        case 'Nov': $t_val += (11*30*24*60*60);
                    break;
        case 'Dec': $t_val += (12*30*24*60*60);
                    break;
        default :   $t_val += (0*30*24*60*60);
                    break;            
    }
    if(preg_match($reg_exUrl, $text, $url)) {

       
        $userInfo = $twClient->get('account/verify_credentials');
        $user_stamp = md5($userInfo->id.$profile->id.$url[0]);
        $sql1 = $conn->query("SELECT * FROM links WHERE user_stamp = '$user_stamp'");
        if($sql1->num_rows == 0)
        {    
        $sql = "INSERT INTO links (user_id, follower_id, link, user_stamp, follower_name, follower_pic, follower_handle, st_text, created, t_val)VALUES ('$userInfo->id', '$profile->id', '$url[0]', '$user_stamp', '$profile->name' ,'$profile->profile_image_url', '$profile->screen_name', '$text', '$created','$t_val')";

            if ($conn->query($sql) === TRUE) {
                
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }

        
       

} else {

       // if no urls in the text just return the text
       continue;

}
}
else
break;
    
    //$output .= '<li>'.$profile->screen_name.' <br />-<i>'.$profile->status->text.'</i></li>';

  }


 } 

//var_dump($profiles);
$output .= '<main class="mt-5">

        <!--Main container-->
        <div class="container">

            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
             
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-10">

                    <div class="mb-4">
                        <h2>Welcome!</h2>
                        <hr>
                        <p>Here are the links tweeted by the users you followed.</p>
                       
                    </div>

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->

            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
                ';
                  $sql = "SELECT * FROM links WHERE user_id = '$userInfo->id' ORDER BY t_val DESC";
                  $result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        //echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
        $texta = explode(" ", $row["created"]);
        $textb = explode(":", $texta[3]);
                $output .= '
                <div class="col-lg-4 col-md-6">

                    <!--Card-->
                    <div class="card mb-4">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            &nbsp;&nbsp;<img style="border-radius:50%;height:60px;width:60px;margin-left:1%;" src="'.$row["follower_pic"].'" class="img-fluid" alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">
                            <!--Title-->
                            <h4 class="card-title" style="margin-top:-19%;margin-left:15%;">'.$row["follower_name"].'</h4><p style="color:#ccc;"><i style="margin-left:15%;">(@'.$row["follower_handle"].')</i>&nbsp;&nbsp;&nbsp;&nbsp; <div><p>'.$texta[0].' '.$texta[1].' '.$texta[2].', '.$textb[0].':'.$textb[1].'</p></div><p>
                            <!--Text-->
                            <p class="card-text">'.$row['st_text'].'.</p>
                            <a target = "_blank" href="'.$row["link"].'" class="btn btn-primary"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;View</a>
                        </div>

                    </div>
                    <!--/.Card-->

                </div>';
            }
        }
              $output .=  '</div></main>';
$output .= '</ul></div>';
   $output .= '  <footer class="page-footer blue center-on-small-only">

        <!--Footer Links-->
      
        <!--/.Footer Links-->

        <!--Copyright-->
        <div class="footer-copyright">
          
            <div class="container-fluid">

               <span style="color:white;float:right"> Made for <b>Tapzo</b> by Sidharth Shridhar (141374) , Jaypee University of Information Technology, Waknaghat (H.P.)</span>
<span style="color:white;float:left"> <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;&nbsp; sidharth.shridhar@gmail.com</span>


            </div>
        </div>
        <!--/.Copyright-->

    </footer>
    <!--/.Footer-->


    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <!-- Popper -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>';
    
    //Display profile iamge and tweet form
   $conn->close();
    //var_dump($profiles);
}elseif(isset($_REQUEST['oauth_token']) && $_SESSION['token'] == $_REQUEST['oauth_token']){
    //Call Twitter API
    $twClient = new TwitterOAuth($consumerKey, $consumerSecret, $_SESSION['token'] , $_SESSION['token_secret']);
    
    //Get OAuth token
    $access_token = $twClient->getAccessToken($_REQUEST['oauth_verifier']);
    
    //If returns success
    if($twClient->http_code == '200'){
        //Storing access token data into session
        $_SESSION['status'] = 'verified';
        $_SESSION['request_vars'] = $access_token;
        
        //Get user profile data from twitter
        $userInfo = $twClient->get('account/verify_credentials');

        //Initialize User class
        $user = new User();
        
        //Insert or update user data to the database
        $name = explode(" ",$userInfo->name);
        $fname = isset($name[0])?$name[0]:'';
        $lname = isset($name[1])?$name[1]:'';
        $profileLink = 'https://twitter.com/'.$userInfo->screen_name;
        $twUserData = array(
            'oauth_provider'=> 'twitter',
            'oauth_uid'     => $userInfo->id,
            'first_name'    => $fname,
            'last_name'     => $lname,
            'email'         => '',
            'gender'        => '',
            'locale'        => $userInfo->lang,
            'picture'       => $userInfo->profile_image_url,
            'link'          => $profileLink,
            'username'      => $userInfo->screen_name
        );
        
        $userData = $user->checkUser($twUserData);
        
        //Storing user data into session
        $_SESSION['userData'] = $userData;
        
        //Remove oauth token and secret from session
        unset($_SESSION['token']);
        unset($_SESSION['token_secret']);
        
        //Redirect the user back to the same page
        header('Location: ./');
    }else{
        $output = '<h3 style="color:red">Some problem occurred, please try again.</h3>';
    }
}else{
    //Fresh authentication
    $twClient = new TwitterOAuth($consumerKey, $consumerSecret);
    $request_token = $twClient->getRequestToken($redirectURL);
    
    //Received token info from twitter
    $_SESSION['token']       = $request_token['oauth_token'];
    $_SESSION['token_secret']= $request_token['oauth_token_secret'];
    
    //If authentication returns success
    if($twClient->http_code == '200'){
        //Get twitter oauth url
        $authUrl = $twClient->getAuthorizeURL($request_token['oauth_token']);
        $output = '
        <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Tapzo|Login</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">

    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        
        html,
        body,
        .view {
            height: 100%;
        }
        /* Navigation*/
        
        .navbar {
            background-color: transparent;
        }
        
        .scrolling-navbar {
            -webkit-transition: background .5s ease-in-out, padding .5s ease-in-out;
            -moz-transition: background .5s ease-in-out, padding .5s ease-in-out;
            transition: background .5s ease-in-out, padding .5s ease-in-out;
        }
        
        .top-nav-collapse {
            background-color: #1C2331;
        }
        
        footer.page-footer {
            background-color: #1C2331;
            margin-top: -1px;
        }
        
        @media only screen and (max-width: 768px) {
            .navbar {
                background-color: #1C2331;
            }
        }
        .navbar .btn-group .dropdown-menu a:hover {
            color: #000 !important;
        }
        .navbar .btn-group .dropdown-menu a:active {
            color: #fff !important;
        }
        /*Call to action*/
        
        .flex-center {
            color: #fff;
        }
        
        .view {
            background: url("https://mdbootstrap.com/img/Photos/Others/img%20(50).jpg")no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>

</head>

<body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">
            <div class="container">
                <a class="navbar-brand" href="#"><i class="fa fa-twitter fa-3x" aria-hidden="true"></i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="#"><b>Twitter Link Feed</b></a>
                        </li>
                      
                    </ul>
                    <p style="color:white">Made with <i class="fa fa-heart" aria-hidden="true" style="color:red"></i> for <b>Tapzo</b></p>
                </div>
            </div>
        </nav>

    <!--/.Navbar-->
    <!--Mask-->
    <div class="view hm-black-light">
        <div class="full-bg-img flex-center">
            <ul class="animated fadeInUp">
                <li>
                    <h1 class="h1-responsive font-bold">Missed your favourite tweets of the Day?</h1></li>
                <li>
                    <h4>No worries... we will handle it!</h4>
                </li>
                <li>
                     <a href="'.filter_var($authUrl, FILTER_SANITIZE_URL).'" class="btn btn-primary btn-lg" rel="nofollow"><i class="fa fa-twitter " aria-hidden="true"></i>&nbsp;&nbsp;|&nbsp;&nbsp;Login with Twitter</a>
                    
                </li>
            </ul>
        </div>
    </div>
    <!--/.Mask-->

    <!--Footer-->
    <footer class="page-footer center-on-small-only">


       

        <!--Call to action-->

        <!--/.Call to action-->

        <!--Copyright-->
        <div class="footer-copyright">
            <div class="container-fluid">
                Made for <b>Tapzo</b> by Sidharth Shridhar (141374) , Jaypee University of Information Technology, Waknaghat (H.P.)

            </div>
        </div>
        <!--/.Copyright-->

    </footer>
     <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

    <!-- Bootstrap dropdown -->
    <script type="text/javascript" src="js/popper.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    ';
        //Display twitter login button
       
    }else{
        $output = '<h3 style="color:red">Error connecting to twitter! try again later!</h3>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">



    <!--Navbar-->
        
    <!--/.Footer-->
    <?php echo $output; ?>

    <!-- SCRIPTS -->

    <!-- JQuery -->
   


</body>

</html>