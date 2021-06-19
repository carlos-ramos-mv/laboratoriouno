<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function index()
    {

        $cursos = [];
        $cursosUser = [];

        if (sizeof($c = Curso::where('status', '=', 't')->get()) > 0) {

            $cursosUser = Auth::user()->cursos()->where('status', '=', 't')->get();
            $cursos = $c;

            if (sizeof($cursosUser) > 0) {
                $cursos = [];
                for ($i = 0; $i < sizeof($c); $i++) {
                    for ($j = 0; $j < sizeof($cursosUser); $j++) {
                        if ($c[$i]->id != $cursosUser[$j]->id) {
                            $cursos[] = $c[$i];
                            break;
                        }
                    }
                }
            }
        }
        return view('alumno.home', compact('cursos', 'cursosUser'));
    }
}
