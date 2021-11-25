<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Noticias extends Model
{
    protected $fillable = ['titulo', 'descricao', 'materia', 'created_at', 'updated_at'];
    protected $perPage = 5;
}
