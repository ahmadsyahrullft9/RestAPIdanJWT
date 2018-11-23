<?php

require_once('utils/functions.php');

$request_uri = explode('?', $_SERVER['REQUEST_URI'], 2);
$uri = explode('/', $request_uri[0]);

/*
    "http://localhost/rest_jwt/v2/about"  
    uri ==>  [ "", "rest_jwt", "v2", "about"]
*/

switch ($uri[2]) {
    default: // default endpoint//
        $api = new Api;
        $api->processApi();
    break;
}

?>