<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Avance;
use App\Models\Curso;
use App\Models\Modulo;
use App\Models\User;
use App\Traits\AdminTrait;
use App\Traits\InstructorTrait;
use Illuminate\Support\Facades\Auth;

class ModuloController extends Controller
{
    use AdminTrait;
    use InstructorTrait;

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
    public function create(Request $request)
    {
        $curso = Curso::find($request->curso);
        $modulo = $curso->modulos()->select('numero')->orderBy('numero','desc')->first();
        $last = 0;
        if ($modulo!=null) {
            $last = $modulo->numero;
        }
        return view('admin.modulos.create', compact('last'));
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

        if (Modulo::select('id', 'numero')->where('numero',$request->numero)->first()) {
            $this->renumerarModulos($request->curso,$request->numero);
        }
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
         *  progreso de avance de los alumnos inscritos.
         */
        if ($modulo->curso->status) {
            $modulo->status = true;
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
            $avance = new Avance();
            foreach ($users as $user) {
                $avance->avanzable_id = $modulo->id;
                $avance->avanzable_type = 'App\Models\Modulo';
                $avance->user_id = $user->id;
                $avance->progreso = 0;
                $avance->save();
                $avance = new Avance();
                $this->actualizarProgresoCurso($modulo->curso,$user->id);
            }
            
        } else {
            $modulo->status = false;
        }
        $modulo->save();

        //return redirect()->action([CursoController::class, 'show'], $request->curso)->with('modulo-store', '¡Módulo agregado correctamente!');
        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.cursos.show',$request->curso)->with('modulo-store', '¡Módulo agregado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.cursos.show',$request->curso)->with('modulo-store', '¡Módulo agregado correctamente!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Modulo $modulo)
    {
        $temas = $modulo->temas()->orderBy('numero')->get();
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

        if (Modulo::select('id', 'numero')->where('numero',$request->numero)->first()) {
            $this->renumerarModulos($modulo->curso->id,$request->numero,$modulo->id);
        }
        
        $modulo->numero = $request->numero;
        $modulo->titulo = $request->titulo;
        $modulo->breve_descripcion = $request->breveDescripcion;
        $modulo->descripcion = $request->descripcion;

        $modulo->save();

        //return redirect()->action([CursoController::class, 'show'], $modulo->curso_id)->with('modulo-update','¡Módulo actualizado correctamente!');
        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.cursos.show',$modulo->curso_id)->with('modulo-update','¡Módulo actualizado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.cursos.show',$modulo->curso_id)->with('modulo-update','¡Módulo actualizado correctamente!');
        }
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
        //return redirect()->action([CursoController::class, 'show'], $curso)->with('modulo-delete','¡Módulo eliminado correctamente!');
        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.cursos.show',$curso)->with('modulo-delete','¡Módulo eliminado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.cursos.show',$curso)->with('modulo-delete','¡Módulo eliminado correctamente!');
        }
    }

}
