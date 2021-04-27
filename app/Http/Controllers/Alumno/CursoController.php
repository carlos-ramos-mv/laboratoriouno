<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Curso;
use App\Models\Modulo;
use App\Models\Tema;
use Illuminate\Database\Eloquent\Model;
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
        //
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
    public function show($id){

        $curso = Curso::find($id);

        $modulos = $curso->modulos;

        $temas = [];

        for ($i=0; $i < sizeof($modulos); $i++) { 
            // $temas[] = Tema::where('modulo_id','=',$modulos[$i]->id)->select('id','titulo','modulo_id')->get();
            $temas[] = $modulos[$i]->temas;

        }
        

        // $data = ['curso' => $curso, 'modulos' => $modulos, 'temas' => $temas];

        return view('alumno.cursos.show', compact('curso','modulos','temas'));
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
