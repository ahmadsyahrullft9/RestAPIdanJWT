<?php

require_once('utils/functions.php');

$request_uri = explode('?', $_SERVER['REQUEST_URI'], 2);
$uri = explode('/', $request_uri[0]);

/*
    jika urlnya sepertin ini "http://localhost/rest_jwt/v2/about" maka hasil endpoint nya seperti ini.. 
    [ "", "rest_jwt", "v2", "about"]
*/

//mainkan endpoint nya disini !!!
switch ($uri[2]) {
    default: // default endpoint//
        $api = new Api;
        $api->processApi();
    break;
}

?>