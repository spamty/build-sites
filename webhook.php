<?php

print_r("HTTP_X_EVENT_KEY ".$_SERVER['HTTP_X_EVENT_KEY']."   ");
print_r("HTTP_X_REQUEST_UUID ".$_SERVER['HTTP_X_REQUEST_UUID']."   ");
print_r("HTTP_X_ATTEMPT_NUMBER ".$_SERVER['HTTP_X_ATTEMPT_NUMBER']."   ");
print_r("HTTP_X_HOOK_UUID ".$_SERVER['HTTP_X_HOOK_UUID']."   ");

if( $_GET['site'] == "api-doc" ){
	$shReturned = shell_exec("/var/build-sites/spamty.api-doc.sh");
	print_r($shReturned);
	die("Done.");
}elseif( $_GET['site'] == "api" ){
	$shReturned = shell_exec("/var/build-sites/spamty.api.sh");
	print_r($shReturned);
	die("Done.");
}elseif( $_GET['site'] == "blog" ){
	$shReturned = shell_exec("/var/build-sites/spamty.blog.sh");
	print_r($shReturned);
	die("Done.");
}elseif( $_GET['site'] == "cdn" ){
	$shReturned = shell_exec("/var/build-sites/spamty.cdn.sh");
	print_r($shReturned);
	die("Done.");
}elseif( $_GET['site'] == "website" ){
	$shReturned = shell_exec("/var/build-sites/spamty.website.sh");
	print_r($shReturned);
	die("Done.");
}else{
	die("Invalid value for GET *site*.");
}