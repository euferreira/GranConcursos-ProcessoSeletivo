<?php

namespace App\Http\Controllers;

use App\Models\Usuarios;
use DateTime;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Support\Facades\Hash;
use Laravel\Lumen\Routing\Controller;

class UsuarioController extends Controller
{
    public function login(Request $request)
    {
        try {
            $this->validate($request, ['email' => 'required', 'senha' => 'required']);
            $usuario = new Usuarios();
            $result = Usuarios::where('email', $request->email)->where('senha', $request->senha)->get()->first();

            if (is_null($result)) {
                return response()->json($usuario->parseResponseFailed("Usuário não cadastrado!"), 400);
            }
            return response()->json($usuario->parseResponseOk($result));
        } catch (Exception $e) {
            return response()->json(['Error' => $e->getMessage()], 500);
        }
    }

    public function cadastrar(Request $request)
    {
        try {
            //Verifica se o usuário dado seu e-mail
            $usuario = Usuarios::where('email', $request->email)->first();
            if (!is_null($usuario)) {
                return response()->json($usuario->parseResponseFailed('Usuário já cadastrado!'), 400);
            }
            $dados = [
                'nome' => $request->nome,
                'email' => $request->email,
                'senha' => $request->senha,
                'created_At' => new DateTime('now'),
                'updated_At' => new DateTime('now'),
            ];
            return response()->json(Usuarios::create($dados), 201);
            //return response()->json(Usuarios::create($request->all()), 201);
        } catch (Exception $e) {
            return response()->json(['Error' => $e->getMessage()], 500);
        }
    }
}
