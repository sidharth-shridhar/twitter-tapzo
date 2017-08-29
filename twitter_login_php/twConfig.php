<?php
if(!session_id()){
    session_start();
}

//Include Twitter client library 
include_once 'src/twitteroauth.php';

/*
 * Configuration and setup Twitter API
 */
$consumerKey = 'd3zkjOsEuYypxuOyxhfBjmw7d';
$consumerSecret = 'ByxCnxf2VCt5wYSeQYEpQRlHDA7QmcXzsYxZgqpscX6RqHUy7d';
$redirectURL = 'http://localhost/twitter_login_php/index.php';

?>