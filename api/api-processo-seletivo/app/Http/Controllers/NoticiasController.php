<?php

namespace App\Http\Controllers;

use App\Models\Noticias;
use Exception;
use Illuminate\Http\Request;
use Laravel\Lumen\Routing\Controller;

class NoticiasController extends Controller
{
    public function getNoticias(Request $request)
    {
        try {
            return Noticias::paginate($request->per_page);
        }
        catch (Exception $e) {
            return response()->json(
                [
                    'Error' => $e->getMessage()
                ],
                500
            );
        }
    }
}
