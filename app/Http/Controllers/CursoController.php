<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use App\Models\Modulo;
use App\Models\Tema;
use Illuminate\Http\Request;

class CursoController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function show($id){

        $curso = Curso::find($id);

        $modulos = Modulo::where('id_curso','=',$id)->get();

        $temas = [];

        for ($i=0; $i < sizeof($modulos); $i++) { 
            $temas[] = Tema::where('id_modulo','=',$modulos[$i]->id)->select('id','titulo','id_modulo')->get();
        }
        

        $data = ['curso' => $curso, 'modulos' => $modulos, 'temas' => $temas];

        return view('cursos.show', compact('data'));
    }

    public function create(){
        return view('cursos.create');
    }

    public function store(Request $request){

        return $request;
    }

}
