<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Eventos extends Model
{
    protected $fillable = ['titulo', 'descricao','conteudo', 'produtor', 'created_at', 'updated_at'];
    protected $perPage = 5;
}
