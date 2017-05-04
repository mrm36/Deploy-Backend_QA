#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function deployBackendPackage($request)
{
	echo "\nRecieved Request: Installing backend package...\n";
	shell_exec('sh /home/matt/Scripts/install_backend.sh'); 
	echo "Success!\n";
}

function requestProcessor($request)
{
  echo "Request Received".PHP_EOL;
  var_dump($request);
  echo '\n' . 'End Message';
  if(!isset($request['type']))
  {
    return "ERROR: unsupported message type";
  }
  switch ($request['type'])
  {
    case "BEqa":
      return deployBackendPackage($request);	
  }
}

$server = new rabbitMQServer("deployRabbitServer.ini","backendQA");

$server->process_requests('requestProcessor');
exit();
?>
