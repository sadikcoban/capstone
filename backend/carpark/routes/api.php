<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group(["prefix"=>"/api/carpark"], function () use ($router){

    $router->group(["prefix" => "/owner"], function () use($router){
        $router->get('', "\App\Http\Controllers\OwnerController@index");
        $router->post('', "\App\Http\Controllers\OwnerController@store");
        $router->get('/{id}', "\App\Http\Controllers\OwnerController@show");


    });

    $router->group(["prefix" => "/carpark-location"], function () use($router){
        $router->post('', "\App\Http\Controllers\CarparkLocationController@store");
        $router->get('/{id}', "\App\Http\Controllers\CarparkLocationController@show");

        $router->get('/of/{owner_id}', "\App\Http\Controllers\CarparkLocationController@index");   
        $router->post('/with-lots', "\App\Http\Controllers\CarparkLocationController@createWithLots");
        
        $router->get('/near-locations/{city_id}', "\App\Http\Controllers\CarparkLocationController@getNearLocations");   



    });



});
