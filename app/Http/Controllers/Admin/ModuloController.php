<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tema;
use App\Models\Modulo;

class ModuloController extends Controller
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
        $modulo = new Modulo();

        $modulo->numero = $request->numero;
        $modulo->titulo = $request->titulo;
        $modulo->descripcion = $request->descripcion;
        $modulo->curso_id = $request->curso;

        // $imagen = $request->file('file')->store('public/imagenes/modulos');
        // $url = Storage::url($imagen);
        $modulo->save();

        $modulo = Modulo::latest('id')->first();

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
        $modulo->numero = $request->numero;
        $modulo->titulo = $request->titulo;
        $modulo->descripcion = $request->descripcion;

        $modulo->save();

        return redirect()->route('admin.cursos.show',$modulo->curso_id)->with('modulo-update','¡Módulo actualizado correctamente!');
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
