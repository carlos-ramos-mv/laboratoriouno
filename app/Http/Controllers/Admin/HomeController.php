<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('admin.home');
    }

    public function publicar()  
    {
        $cursos = $this->getCursos();
        return view('admin.publicar',compact('cursos'));
    }

    private function getCursos()
    {
        $cursos = Curso::select('id','nombre','status')->get();
        foreach ($cursos as $curso ) {
            $modulos = $curso->modulos()->select('id','titulo','status')->get();
            foreach ($modulos as $modulo) {
                $temas = $modulo->temas()->select('titulo','status','id')->orderBy('id','asc')->get();
                foreach ($temas as $tema ) {
                    $tema->actividades()->select('id','titulo','status')->get();
                }
            }
        }
        return $cursos;
    }
}
