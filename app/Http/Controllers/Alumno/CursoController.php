<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Curso;
use App\Traits\AlumnoTrait;

class CursoController extends Controller
{
    use AlumnoTrait;

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
        //return view('alumno.cursos.finalizado');
        return redirect()->action([HomeController::class, 'index'])->with('curso-finalizado','¡Felicidades, concluiste un curso exitosamente!');
    }

    public function inscribirse(Curso $curso)
    {
        $this->inscripcion($curso, Auth::user());
        return redirect()->action([CursoController::class, 'show',], $curso->id)->with('inscrito', '¡Ahora estás inscrito en este curso!');
    }
}
