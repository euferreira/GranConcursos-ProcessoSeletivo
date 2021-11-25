<?php

namespace App\Http\Controllers;

use App\Models\Usuarios;
use Exception;
use Laravel\Lumen\Routing\Controller;
use Firebase\JWT\JWT;

class TokenController extends Controller
{
    public function gerarToken(Usuarios $usuarios)
    {
        try {
            if (is_null($usuarios->email) || is_null($usuarios->senha)) {
                return null;
            }

            $token = JWT::encode(['email' => $usuarios->email], env('JWT_KEY'));
            return $token;
        } catch (Exception $e) {
            return null;
        }
    }
}
