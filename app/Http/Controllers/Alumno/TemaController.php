<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tema;
use Illuminate\Support\Facades\Auth;

class TemaController extends Controller
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
    public function show($id)
    {

        /**
         * TIPOS DE TEMAS
         * 1. 'si-actividades': Cuenta con actividades y no es el último tema del modulo
         * 2. 'no-actividades': No cuenta con actividades y no es el último tema del modulo
         * 3. 'ultimo-elemento': No cuenta con actividades y es el último tema pero no del ultimo modulo
         * 4. 'ultimo-modulo-y-elemento': No cuenta con actividades y es el último tema y modulo del curso
         * 
        */

        $tema = Tema::find($id);
        $u = 'si-actividades';

        //VERIFICAR SI EL TEMA TIENE ACTIVIDADES
        if (sizeof($tema->actividades)==0) {
            $u = 'no-actividades';
            //VERIFICAR SI EL TEMA ES EL ULTIMO
            $ultimoTema = $tema->modulo->temas()->select('id')->orderBy('numero','desc')->first();
            if ($tema->id == $ultimoTema->id) {
                $u = 'ultimo-elemento'; //Mostrar la modal solo con rate de estrellas
                //VERIFICAR SI EL MODULO ES EL ULTIMO
                $ultimoModulo = $tema->modulo->curso->modulos()->select('id')->orderBy('numero','desc')->first();
                if ($tema->modulo()->select('id')->first() == $ultimoModulo) {
                    $u = 'ultimo-modulo-y-elemento'; //Mostrar la modal con rate de estrellas y feeback
                }
            }
        }

        //VERIFICAR SI YA HA SIDO EVALUADO EL TEMA
        $rate = $tema->rates()->select('id','rate')->where('user_id',Auth::user()->id)->first();

        return view('alumno.temas.show', compact('tema','rate','u'));
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
