<?php

namespace Database\Seeders;

use DateTime;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class EventosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 10; $i++) {
            DB::table('eventos')->insert([
                'titulo' => Str::random(),
                'descricao' => Str::random(),
                'conteudo' => Str::random(30),
                'produtor' => Str::random(8),
                'created_At' => new DateTime('now'),
                'updated_At' => new DateTime('now'),
            ]);
        }
    }
}
