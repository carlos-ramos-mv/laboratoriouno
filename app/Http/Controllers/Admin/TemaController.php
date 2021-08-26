<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\Avance;
use App\Models\Modulo;
use App\Models\Tema;
use App\Models\User;
use App\Traits\InstructorTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class TemaController extends Controller
{
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
        $modulo = Modulo::find($request->modulo);
        $tema = $modulo->temas()->select('numero')->orderBy('numero', 'desc')->first();
        $last = 0;
        if ($tema != null) {
            $last = $tema->numero;
        }
        return view('admin.temas.create', compact('last'));
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
            'introduccion' => 'required',
            'contenido' => 'required',
        ]);

        if (Tema::select('id', 'numero')->where('numero', $request->numero)->first()) {
            $this->renumerarTemas($request->modulo, $request->numero);
        }
        $tema = new Tema();

        $tema->numero = $request->numero;
        $tema->titulo = $request->titulo;
        $tema->breve_descripcion = $request->breveDescripcion;
        $tema->contenido = $request->contenido;
        $tema->introduccion = $request->introduccion;
        $tema->modulo_id = $request->modulo;

        $tema->save();

        if ($tema->modulo->status && $tema->modulo->curso->status) {
            $tema->status = true;
            //Usuarios del curso
            $usersCurso = $tema->modulo->curso->users()->select('id')->get();
            //Usuarios que son alumnos
            $usersRole = User::role('Alumno')->select('id')->get();
            //Limpiar propiedad 'pivot' de los usuarios del curso
            foreach ($usersCurso as $user) {
                unset($user->pivot);
            }
            //Comparar las colecciones para obtener los usuarios que pertenezcan al
            //curso y que además sean alumnos.
            $users = $usersCurso->intersect($usersRole);

            //Se actualiza cada avance de curso y modulo de cada usuario que es un alumno del curso
            $avance = new Avance();
            foreach ($users as $user) {
                $avance->avanzable_id = $tema->id;
                $avance->avanzable_type = 'App\Models\Tema';
                $avance->user_id = $user->id;
                $avance->progreso = 0;
                $avance->save();
                $avance = new Avance();

                $this->actualizarProgresoModulo($tema->modulo, $user->id);
                $this->actualizarProgresoCurso($tema->modulo->curso, $user->id);
            }
        } else {
            $tema->status = false;
        }

        $tema->save();

        //return redirect()->action([ModuloController::class, 'show'], $request->modulo)->with('tema-store', '¡Tema agregado correctamente!');
        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.modulos.show', $request->modulo)->with('tema-store', '¡Tema agregado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.modulos.show', $request->modulo)->with('tema-store', '¡Tema agregado correctamente!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Tema $tema)
    {
        return view('admin.temas.show', compact('tema'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Tema $tema)
    {
        return view('admin.temas.edit', compact('tema'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tema $tema)
    {

        $request->validate([
            'numero' => 'required|numeric',
            'titulo' => 'required|max:150',
            'breveDescripcion' => 'required|max:100',
            'introduccion' => 'required',
            'contenido' => 'required',
        ]);

        if (Tema::select('id', 'numero')->where('numero', $request->numero)->first()) {
            $this->renumerarTemas($tema->modulo->id, $request->numero, $tema->id);
        }

        $tema->titulo = $request->titulo;
        $tema->breve_descripcion = $request->breveDescripcion;
        $tema->introduccion = $request->introduccion;
        $tema->contenido = $request->contenido;

        $tema->save();

        //return redirect()->action([ModuloController::class, 'show'], $tema->modulo_id)->with('tema-update', '¡Tema actualizado correctamente!');
        //return redirect()->route('admin.modulos.show',$tema->modulo_id)->with('tema-update','¡Tema actualizado correctamente!');
        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.modulos.show', $tema->modulo_id)->with('tema-update', '¡Tema actualizado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.modulos.show', $tema->modulo_id)->with('tema-update', '¡Tema actualizado correctamente!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tema $tema)
    {
        DB::beginTransaction();
        try {
            $modulo = $tema->modulo_id;
            $this->deleteTema($tema);
            $tema->delete();
            DB::commit();
            Log::info("Done");
            if (Auth::user()->hasRole('Admin')) {
                return redirect()->route('admin.modulos.show', $modulo)->with('tema-delete', '¡Tema eliminado correctamente!');
            } else if (Auth::user()->hasRole('Instructor')) {
                return redirect()->route('instructor.modulos.show', $modulo)->with('tema-delete', '¡Tema eliminado correctamente!');
            }
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
            return redirect()->back()->withErrors(['error-tema-delete', 'Hubo un error al eliminar el tema.']);
        }
    }
}
