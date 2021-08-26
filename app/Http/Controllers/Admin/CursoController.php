<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use App\Traits\InstructorTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CursoController extends Controller
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
        $cursos = Curso::all();
        return view('admin.cursos.index', compact('cursos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.cursos.create');
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
            'nombre' => 'required|max:150',
            'breveDescripcion' => 'required|max:100',
            'descripcion' => 'required',
        ]);

        $curso = new Curso();

        $curso->nombre = $request->nombre;
        $curso->breve_descripcion = $request->breveDescripcion;
        $curso->descripcion = $request->descripcion;

        // $imagen = $request->file('file')->store('public/imagenes/cursos');
        // $url = Storage::url($imagen);
        $curso->save();

        $curso = Curso::latest('id')->first();

        if (Auth::user()->hasRole('Admin')) {
            return redirect()->route('admin.cursos.show', $curso->id)->with('status', '¡Curso agregado correctamente!');
        } else if (Auth::user()->hasRole('Instructor')) {
            return redirect()->route('instructor.cursos.show', $curso->id)->with('status', '¡Curso agregado correctamente!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Curso $curso)
    {
        $modulos = $curso->modulos()->orderBy('numero')->get();
        foreach ($modulos as $modulo) {
            $modulo->avances()->where('user_id', Auth::user()->id)->get();
        }
        return view('admin.cursos.show', compact('curso', 'modulos'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Curso $curso)
    {
        return view('admin.cursos.edit', compact('curso'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Curso $curso)
    {
        $status = false;
        if (isset($request->status)) {
            $status = true;
        }

        DB::beginTransaction();
        try {
            $request->validate([
                'nombre' => 'required|max:150',
                'breveDescripcion' => 'required|max:100',
                'descripcion' => 'required',
            ]);
            $curso->nombre = $request->nombre;
            $curso->breve_descripcion = $request->breveDescripcion;
            $curso->descripcion = $request->descripcion;
            $curso->status = $status;
    
            $curso->save();
            DB::commit();
            Log::info("Update curso done");

            if (Auth::user()->hasRole('Admin')) {
                return redirect()->route('admin.cursos.index')->with('edit', '¡Curso editado correctamente!');
            } else if (Auth::user()->hasRole('Instructor')) {
                return redirect()->route('instructor.cursos.index')->with('edit', '¡Curso editado correctamente!');
            }
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
            return redirect()->back()->withErrors(['error-edit', 'Hubo un error al eliminar el curso.']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Curso $curso)
    {
        DB::beginTransaction();
        try {
            $this->deleteCurso($curso);
            $curso->delete();
            DB::commit();
            Log::info("Done");
            if (Auth::user()->hasRole('Admin')) {
                return redirect()->route('admin.cursos.index')->with('delete', '¡Curso eliminado correctamente!');
            } else if (Auth::user()->hasRole('Instructor')) {
                return redirect()->route('instructor.cursos.index')->with('delete', '¡Curso eliminado correctamente!');
            }
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
            return redirect()->back()->withErrors(['error-delete', 'Hubo un error al eliminar el curso.']);
        }
    }
}
