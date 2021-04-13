<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use App\Models\Modulo;
use App\Models\Tema;
use Illuminate\Http\Request;

class ModuloController extends Controller
{
    public function show($id){

        $modulo = Modulo::find($id);

        $temas = Tema::where('id_modulo','=',$id)->select('id', 'titulo', 'id_modulo')->get();

        $data = ['modulo' => $modulo, 'temas' => $temas];

        return view('cursos.modulos.show', compact('data'));
    }

}
