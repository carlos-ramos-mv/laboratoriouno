<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use Illuminate\Http\Request;

class CursoController extends Controller
{
    public function show($id){

        $curso = Curso::find($id);
        return view('cursos.show', compact('curso'));
    }
}
