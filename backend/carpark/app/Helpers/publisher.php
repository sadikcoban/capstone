<?php

use Basis\Nats\Client;
use Basis\Nats\Configuration;
use NatsStreaming\Connection;
use NatsStreaming\ConnectionOptions;

/*
function publish($subject, $data)
{




    $options = new ConnectionOptions();
    //        $options->setHost("172.17.0.23");
    $client = new \Nats\Connection();

    $client->connect();
   
    /*

        $options->setClientID("ticketing");
        $options->setClusterID($cluster_id);

    // Simple Publisher.
    $client->publish($subject, $data);
 

    // Wait for 1 message.
     //$client->wait(1);
}
 */

function publish($subject, $data)
{
    print_r("EEEE");


    $options = new ConnectionOptions();
    
    $options->setClientID("ticketing");
    $options->setClusterID("asd");
    print_r("sdsd");
    
    $c = new Connection();


   

    $c->connect(10);
    // Publish
    $r = $c->publish($subject, $data);
}

function generateRandomString($length = 10)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
