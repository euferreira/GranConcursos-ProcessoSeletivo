<?php

namespace App\Models;

use App\Http\Controllers\TokenController;
use Illuminate\Database\Eloquent\Model;

class Usuarios extends Model
{
    protected $fillable = ['nome', 'email','senha', 'created_at', 'updated_at'];
    protected $appends = ['token'];
    protected $hidden = [
        'senha',
    ];

    public function getTokenAttribute() : string {
        $token = new TokenController();
        return $token->gerarToken($this);
    }

    public function parseResponseOk($usuario) : array {
        return [
            'nome' => $usuario->nome,
            'email' => $usuario->email,
            'token' => $usuario->getTokenAttribute()
        ];
    }

    public function parseResponseFailed($resposta) : array {
        return [
            'message' => $resposta
        ];
    }
}
