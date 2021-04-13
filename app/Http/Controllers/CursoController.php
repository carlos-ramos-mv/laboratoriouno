<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use App\Models\Modulo;
use Illuminate\Http\Request;

class CursoController extends Controller
{
    public function show($id){

        $curso = Curso::find($id);

        $modulos = Modulo::where('id_curso','=',$id)->get();

        $data = [$curso, $modulos];

        return view('cursos.show', compact('data'));
    }
}
