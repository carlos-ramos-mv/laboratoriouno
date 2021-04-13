<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tema;

class TemaController extends Controller
{
    public function show($id){

        $tema = Tema::find($id);

        return view('cursos.modulos.temas.show', compact('tema'));
    }
}
