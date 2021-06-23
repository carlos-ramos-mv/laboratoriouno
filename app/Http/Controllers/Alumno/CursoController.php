<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use App\Models\Avance;
use Illuminate\Http\Request;
use App\Models\Curso;
use Illuminate\Support\Facades\Auth;

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
    public function show(Curso $curso)
    {
        $user = Auth::user();
        $vista = 'alumno.cursos.preview';
        $modulos = $curso->modulos;
        $temas = [];

        for ($i = 0; $i < sizeof($modulos); $i++) {
            $temas[] = $modulos[$i]->temas;
        }

        if (sizeof($user->cursos()->where('curso_id', '=', $curso->id)->get()) == 1) {
            $vista = 'alumno.cursos.show';
            $cursoCollection = $user->cursos()->where('curso_id',$curso->id)->get();
            $curso = $cursoCollection[0];
            foreach ($modulos as $modulo) {
                $modulo->avances()->select('progreso','completado')->where('user_id',$user->id)->get();
            }
            foreach ($temas as $temasAgrup) {
                foreach ($temasAgrup as $tema) {
                    $tema->avances()->select('progreso','completado')->where('user_id',$user->id)->get();
                }
            }
        }

        return view($vista, compact('curso', 'modulos', 'temas'));
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

    public function finalizado()
    {
        return view('alumno.cursos.finalizado');
    }

    public function inscribirse(Curso $curso)
    {
        Auth::user()->cursos()->attach($curso,['progreso'=>0,'completado'=>false]);
        $this->crearAvances($curso);
        return redirect()->action([CursoController::class,'show',],$curso->id)->with('inscrito','¡Ahora estás inscrito en este curso!');
    }
    
    //Metodo que crea los avances correspondientes al usuario
    //Se crean avances para los módulos, temas y actividades pertenecientes al curso
    private function crearAvances(Curso $curso)               
    {

        $avance = new Avance();
        $uid= Auth::user()->id;

        if (sizeof($curso->modulos)>0) {
            $modulos = $curso->modulos()->select('id')->get();
            foreach ($modulos as $modulo) { 
                if (sizeof($modulo->temas)>0) {
                    $temas = $modulo->temas()->select('id')->get();
                    foreach ($temas as $tema) { 
                        if (sizeof($tema->actividades)>0) {
                            $actividades = $tema->actividades()->select('id')->get();
                            foreach ($actividades as $actividad) { 
                                $avance->avanzable_id = $actividad->id;
                                $avance->avanzable_type = 'App\Models\Actividad';
                                $avance->user_id = $uid;
                                $avance->progreso = 0;

                                $avance->save();
                                $avance = new Avance();
                            }
                        }
                        $avance->avanzable_id = $tema->id;
                        $avance->avanzable_type = 'App\Models\Tema';
                        $avance->user_id = $uid;
                        $avance->progreso = 0;

                        $avance->save();
                        $avance = new Avance();
                    }
                }
                $avance->avanzable_id = $modulo->id;
                $avance->avanzable_type = 'App\Models\Modulo';
                $avance->user_id = $uid;
                $avance->progreso = 0;
                $avance->completado = false;

                $avance->save();
                $avance = new Avance();
            }
        }

    }
}
