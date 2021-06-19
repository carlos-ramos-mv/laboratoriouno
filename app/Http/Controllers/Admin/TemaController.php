<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tema;
use Illuminate\Http\Request;

class TemaController extends Controller
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
        return view('admin.temas.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tema = new Tema();

        $tema->titulo = $request->titulo;
        $tema->breve_descripcion = $request->breveDescripcion;
        $tema->contenido = $request->contenido;
        $tema->introduccion = $request->introduccion;
        $tema->modulo_id = $request->modulo;

        $tema->save();

        $tema = Tema::latest('id')->first();

        return redirect()->action([ModuloController::class, 'show'], $request->modulo)->with('tema-store', '¡Tema agregado correctamente!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Tema $tema)
    {
        return view('admin.temas.show',compact('tema'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Tema $tema)
    {
        return view('admin.temas.edit',compact('tema'));
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
        $tema->titulo = $request->titulo;
        $tema->breve_descripcion = $request->breveDescripcion;
        $tema->introduccion = $request->introduccion;
        $tema->contenido = $request->contenido;

        $tema->save();

        return redirect()->route('admin.modulos.show',$tema->modulo_id)->with('tema-update','¡Tema actualizado correctamente!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tema $tema)
    {
        $modulo = $tema->modulo_id;
        $tema->delete();
        return redirect()->route('admin.modulos.show',$modulo)->with('tema-delete','¡Tema eliminado correctamente!');
    }
}
