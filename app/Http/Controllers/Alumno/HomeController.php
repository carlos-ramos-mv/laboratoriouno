<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use App\Models\User;
use App\Traits\AlumnoTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    use AlumnoTrait;

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

    public function perfil()
    {
        return view('alumno.perfil');
    }

    public function update(Request $request)
    {
        $this->updateProfile($request, Auth::user());
        return redirect()->route('alumno.home')->with('perfil-updated','¡Perfil actualizado con éxito!');
    }
}
