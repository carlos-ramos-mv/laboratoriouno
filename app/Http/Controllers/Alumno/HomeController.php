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

        $id = Auth::user()->id;

        $relacion = DB::select('select * from curso_user where curso_id='.$id.'');

        $relacion = DB::table('curso_user')->select('curso_id')->where('user_id','=',$id)->get();

        $x = json_decode(json_encode($relacion),true);

        $cursos = [];

        for ($i=0; $i < sizeof($x); $i++) {
            $cursoId = $x[$i]["curso_id"];
            $curso = Curso::find($cursoId);
            $cursos[$i] = $curso;
            
        }

        return view('alumno.cursos.index', compact('cursos'));
    }

}
