<?php
//start session
session_start();
error_reporting(0);
//Include Twitter config file && User class
include_once 'twConfig.php';
include_once 'User.php';

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
    if(isset($_POST["updateme"])){
        $my_update = $twClient->post('statuses/update', array('status' => $_POST["updateme"]));
    }
    $output = '<header>
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
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="img-fluid rounded-circle z-depth-0" width="30"></a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-purple" aria-labelledby="navbarDropdownMenuLink-5">
                                <a class="dropdown-item" href="logout.php">Sign out<i class="fa-li fa fa-sign-out"></i></a>
                            
                            </div>
                        </li>
                    </ul>
    </div>'; 
    //Display username and logout link
    $output = '<div class="welcome_txt">Welcome <strong>'.$username.'</strong> (Twitter ID : '.$twitterId.'). <a href="logout.php">Logout</a>!</div>';
    
    //Display profile iamge and tweet form
    $output .= '<div class="tweet_box">';
    $output .= '<img src="'.$profilePicture.'" width="120" height="110"/>';
    $output .= '<form method="post" action=""><table width="200" border="0" cellpadding="3">';
    $output .= '<tr>';
    $output .= '<td><textarea name="updateme" cols="60" rows="4"></textarea></td>';
    $output .= '</tr>';
    $output .= '<tr>';
    $output .= '<td><input type="submit" value="Tweet" /></td>';
    $output .= '</tr></table></form>';
    $output .= '</div>';
    
    //Get latest tweets
    $myTweets = $twClient->get('statuses/user_timeline', array('screen_name' => $username, 'count' => 10));
    
    //Display the latest tweets
    $output .= '<div class="tweet_list"><strong>Latest Tweets : </strong>';
    $output .= '<ul>';
    foreach($myTweets  as $tweet){
        $output .= '<li>'.$tweet->text.' <br />-<i>'.$tweet->created_at.'</i></li>';
    }
    $output .= '</ul></div>';
    $output .= '<br><br><div class="tweet_list"><strong>Followers : </strong>';
    $output .= '<ul>';
    $profiles = array();
// Get the ids of all followers.
$ids = $twClient->get('followers/ids');
// Chunk the ids in to arrays of 100.
    $ids_arrays = array_chunk($ids->ids, 100);
// Loop through each array of 100 ids.
foreach($ids_arrays as $implode) {
  // Perform a lookup for each chunk of 100 ids.
  $results = $twClient->get('users/lookup', array('user_id' => implode(',', $implode)));
  // Loop through each profile result.
  foreach($results as $profile) {
    // Use screen_name as key for $profiles array.
    $profiles[$profile->screen_name] = $profile;
    $output .= '<li>'.$profile->screen_name.' <br />-<i>'.$profile->status->text.'</i></li>';
  }
  
}
$output .= '</ul></div>';
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
        $output = '<nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">
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
                    <p style="color:white">Made with <i class="fa fa-heart" aria-hidden="true"></i> for <b>Tapzo</b></p>
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
                     <a target="_blank" href="'.filter_var($authUrl, FILTER_SANITIZE_URL).'" class="btn btn-primary btn-lg" rel="nofollow"><i class="fa fa-twitter " aria-hidden="true"></i>&nbsp;&nbsp;|&nbsp;&nbsp;Login with Twitter</a>
                    
                </li>
            </ul>
        </div>
    </div>
    <!--/.Mask-->

    <!--Footer-->
    <footer class="page-footer center-on-small-only">

        <!--Footer links-->
        <div class="container-fluid">
            <div class="row">
                <!--First column-->
                <div class="col-lg-3 col-md-6 ml-auto">
                    <h5 class="title mb-3"><strong>About material design</strong></h5>
                    <p>Material Design (codenamed Quantum Paper) is a design language developed by Google.</p>
                    <p>Material Design for Bootstrap (MDB) is a powerful Material Design UI KIT for most popular HTML, CSS,
                        and JS framework - Bootstrap.</p>
                </div>
                <!--/.First column-->
                <hr class="w-100 clearfix d-sm-none">
                <!--Second column-->
                <div class="col-lg-2 col-md-6 ml-auto">
                    <h5 class="title mb-3"><strong>First column</strong></h5>
                    <ul>
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Second column-->
                <hr class="w-100 clearfix d-sm-none">
                <!--Third column-->
                <div class="col-lg-2 col-md-6 ml-auto">
                    <h5 class="title mb-3"><strong>Second column</strong></h5>
                    <ul>
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Third column-->
                <hr class="w-100 clearfix d-sm-none">
                <!--Fourth column-->
                <div class="col-lg-2 col-md-6 ml-auto">
                    <h5 class="title mb-3"><strong>Third column</strong></h5>
                    <ul>
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Fourth column-->
            </div>
        </div>
        <!--/.Footer links-->

        <hr>

        <!--Call to action-->
        <div class="call-to-action">
            <h4 class="mb-5">Material Design for Bootstrap</h4>
            <ul>
                <li>
                    <h5>Get our UI KIT for free</h5></li>
                <li><a target="_blank" href="https://mdbootstrap.com/getting-started/" class="btn btn-danger" rel="nofollow">Sign up!</a></li>
                <li><a target="_blank" href="https://mdbootstrap.com/material-design-for-bootstrap/" class="btn btn-default" rel="nofollow">Learn more</a></li>
            </ul>
        </div>
        <!--/.Call to action-->

        <!--Copyright-->
        <div class="footer-copyright">
            <div class="container-fluid">
                © 2015 Copyright: <a href="https://www.MDBootstrap.com"> MDBootstrap.com </a>

            </div>
        </div>
        <!--/.Copyright-->

    </footer>';
        //Display twitter login button
       
    }else{
        $output = '<h3 style="color:red">Error connecting to twitter! try again later!</h3>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Material Design Bootstrap</title>

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

    <!--Navbar-->
        
    <!--/.Footer-->
    <?php echo $output; ?>

    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

    <!-- Bootstrap dropdown -->
    <script type="text/javascript" src="js/popper.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>


</body>

</html>