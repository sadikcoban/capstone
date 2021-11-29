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
    $router->get('/', "\App\Http\Controllers\OwnerController@dene");
    $router->get('/create', "\App\Http\Controllers\OwnerController@create");
    $router->get('/show', "\App\Http\Controllers\OwnerController@show");

});
