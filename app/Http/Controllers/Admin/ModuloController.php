<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Modulo;
use App\Models\User;
use App\Traits\CursoTrait;
use Illuminate\Support\Facades\Auth;

class ModuloController extends Controller
{

    use CursoTrait;

    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return view('admin.modulos.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'numero' => 'required|numeric',
            'titulo' => 'required|max:150',
            'breveDescripcion' => 'required|max:100',
            'descripcion' => 'required',
        ]);

        $modulo = new Modulo();

        $modulo->numero = $request->numero;
        $modulo->titulo = $request->titulo;
        $modulo->breve_descripcion = $request->breveDescripcion;
        $modulo->descripcion = $request->descripcion;
        $modulo->curso_id = $request->curso;

        // $imagen = $request->file('file')->store('public/imagenes/modulos');
        // $url = Storage::url($imagen);
        $modulo->save();

        /* 
         *  Si el curso está publicado habrá que actualizar los 
         *  porcentajes de avance y calificaciones de los alumnos 
         *  inscritos.
         */
        if ($modulo->curso->status) {
            //Usuarios del curso
            $usersCurso = $modulo->curso->users()->select('id')->get();
            //Usuarios que son alumnos
            $usersRole = User::role('Alumno')->select('id')->get();
            //Limpiar propiedad 'pivot' de los usuarios del curso
            foreach ($usersCurso as $user) {
                unset($user->pivot);
            }
            //Comparar las colecciones para obtener los usuarios que pertenezcan al
            //curso y que además sean alumnos.
            $users = $usersCurso->intersect($usersRole);

            //Se actualiza cada avance de curso de cada usuario que es un alumno del curso
            foreach ($users as $user) {
                $this->actualizarPorcentajeCurso($modulo->curso, Auth::user()->id);
            }
            
        } 

        return redirect()->action([CursoController::class, 'show'], $request->curso)->with('modulo-store', '¡Módulo agregado correctamente!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Modulo $modulo)
    {
        $temas = $modulo->temas;
        return view('admin.modulos.show',compact('modulo','temas'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Modulo $modulo)
    {
        return view('admin.modulos.edit',compact('modulo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Modulo $modulo)
    {
        $request->validate([
            'numero' => 'required|numeric',
            'titulo' => 'required|max:150',
            'breveDescripcion' => 'required|max:100',
            'descripcion' => 'required',
        ]);
        
        $modulo->numero = $request->numero;
        $modulo->titulo = $request->titulo;
        $modulo->breve_descripcion = $request->breveDescripcion;
        $modulo->descripcion = $request->descripcion;

        $modulo->save();

        return redirect()->action([CursoController::class, 'show'], $modulo->curso_id)->with('modulo-update','¡Módulo actualizado correctamente!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Modulo $modulo)
    {
        $curso = $modulo->curso_id;
        $modulo->delete();
        return redirect()->route('admin.cursos.show',$curso)->with('modulo-delete','¡Módulo eliminado correctamente!');
    }

}
