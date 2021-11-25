<?php

/** @var Router $router */

use Laravel\Lumen\Routing\Router;

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    //grupo para noticias
    $router->group(['prefix' => 'noticias'], function () use ($router) {
        $router->get('', 'NoticiasController@getNoticias');
    });

    //grupo para usuario
    $router->group(['prefix' => 'usuario'], function () use ($router) {
        $router->post('login', 'UsuarioController@login');
        $router->post('cadastrar', 'UsuarioController@cadastrar');
    });

    //grupo para eventos
    $router->group(['prefix' => 'eventos', 'middleware' => 'auth'], function () use ($router) {
        $router->get('', 'EventosController@listar');
    });
});
