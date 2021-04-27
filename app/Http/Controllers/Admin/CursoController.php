<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use App\Models\Tema;
use App\Models\Modulo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CursoController extends Controller
{
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
        
        $curso = new Curso();

        $curso->nombre = $request->nombre;
        $curso->descripcion = $request->descripcion;

        // $imagen = $request->file('file')->store('public/imagenes/cursos');
        // $url = Storage::url($imagen);
        $curso->save();

        $curso = Curso::latest('id')->first();

        return redirect()->action([CursoController::class, 'show'], $curso->id)->with('status', '¡Curso agregado correctamente!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Curso $curso)
    {
        $modulos = $curso->modulos;
        return view('admin.cursos.show', compact('curso','modulos'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Curso $curso)
    {
        return view('admin.cursos.edit',compact('curso'));
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
        $curso->nombre = $request->nombre;
        $curso->descripcion = $request->descripcion;

        $curso->save();

        return redirect()->action([CursoController::class, 'index'])->with('edit', '¡Curso editado correctamente!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Curso $curso)
    {
        $curso->delete();
        // return redirect()->action([CursoController::class, 'index'])->with('delete','¡Curso eliminado correctamente!');
        return redirect()->route('admin.cursos.index')->with('delete','¡Curso eliminado correctamente!');
    }
}
