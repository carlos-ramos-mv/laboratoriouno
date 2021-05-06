<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function index()
    {
        $cursosTrue = Curso::where('status','=','t')->get();

        //INNER JOIN CURSO EN LOS QUE EL USUARIO ESTA INSCRITO

        $cursos = [];
        $idCursos = [];

        if (sizeof($cursosTrue)>0) {
            $cursosUser = Auth::user()->cursos;
            
            for ($i=0; $i < sizeof($cursosUser); $i++) { 
                $idCursos[] = $cursosUser[$i]->id;
            }

        }
        return view('alumno.home', compact('cursos','cursosUser'));
    }

}
