<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tema;

class TemaController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function show($id){

        $tema = Tema::find($id);

        return view('cursos.modulos.temas.show', compact('tema'));
    }

    public function create(){
        return view('cursos.modulos.temas.create');
    }

}
