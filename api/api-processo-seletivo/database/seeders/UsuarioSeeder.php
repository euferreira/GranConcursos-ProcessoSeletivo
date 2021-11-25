<?php

namespace Database\Seeders;

use DateTime;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('usuarios')->insert([
            'nome' => Str::random(),
            'email' => Str::random(10) . '@gmail.com',
            'senha' => Hash::make('senha'),
            'created_At' => new DateTime('now'),
            'updated_At' => new DateTime('now'),
        ]);
    }
}
