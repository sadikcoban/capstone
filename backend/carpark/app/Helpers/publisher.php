<?php

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
  
    $options = new \NatsStreaming\ConnectionOptions();
    $options->setClientID("ticketing");
    $options->setClusterID(generateRandomString());
    $c = new \NatsStreaming\Connection($options);

    $c->connect();

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
