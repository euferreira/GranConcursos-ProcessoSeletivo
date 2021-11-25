<?php

namespace Database\Seeders;

use DateTime;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class NoticiasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 10; $i++) {
            DB::table('noticias')->insert([
                'titulo' => Str::random(),
                'descricao' => Str::random(),
                'materia' => Str::random(30),
                'created_At' => new DateTime('now'),
                'updated_At' => new DateTime('now'),
            ]);
        }
    }
}
