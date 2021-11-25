<?php

namespace App\Http\Controllers;

use App\Models\Eventos;
use Exception;
use Illuminate\Http\Request;
use Laravel\Lumen\Routing\Controller;

class EventosController extends Controller
{
    public function listar(Request $request)
    {
        try {
            return Eventos::paginate($request->per_page);
        } catch (Exception $e) {
            return response()->json(
                [
                    'Error' => $e->getMessage()
                ],
                500
            );
        }
    }
}
