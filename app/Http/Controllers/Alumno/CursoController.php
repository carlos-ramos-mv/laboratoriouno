<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Curso;
use App\Models\Modulo;
use App\Models\Tema;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CursoController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('verified');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();

        $cursos = $user->cursos;

        /* $relacion = DB::select('select * from curso_user where curso_id='.$id.'');

        $relacion = DB::table('curso_user')->select('curso_id')->where('user_id','=',$id)->get();

        $x = json_decode(json_encode($relacion),true);

        $cursos = [];

        for ($i=0; $i < sizeof($x); $i++) {
            $cursoId = $x[$i]["curso_id"];
            $curso = Curso::find($cursoId);
            $cursos[$i] = $curso;
            
        } */

        return view('alumno.cursos.index', compact('cursos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Curso $curso){

        $vista = 'alumno.cursos.preview';

        //Verificar que el alumno esté inscrito al curso
        $user = Auth::user();

        $cursosUser = $user->cursos;

        for ($i=0; $i < sizeof($cursosUser); $i++) { 
            if ($cursosUser[$i]->id==$curso->id) {
                $vista = 'alumno.cursos.show';
                break;
            }
        }

        /* array_search();

        if (count($curso->users->where('user_id','=',Auth::user()->id))>0) {
            
        } */

        $modulos = $curso->modulos;

        $temas = [];

        for ($i=0; $i < sizeof($modulos); $i++) { 
            // $temas[] = Tema::where('modulo_id','=',$modulos[$i]->id)->select('id','titulo','modulo_id')->get();
            $temas[] = $modulos[$i]->temas;

        }

        // $data = ['curso' => $curso, 'modulos' => $modulos, 'temas' => $temas];

        return view($vista, compact('curso','modulos','temas'));
    }

    public function preview(Curso $curso)
    {
        $modulos = $curso->modulos;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
