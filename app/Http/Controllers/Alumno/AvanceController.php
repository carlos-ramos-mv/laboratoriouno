<?php

namespace App\Http\Controllers\Alumno;

use App\Http\Controllers\Controller;
use App\Models\Actividad;
use App\Models\Feedback;
use App\Models\Rate;
use App\Models\Tema;
use App\Traits\TemaTrait;
use App\Traits\ModuloTrait;
use App\Traits\CursoTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

class AvanceController extends Controller
{

    use TemaTrait;
    use ModuloTrait;
    use CursoTrait;

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
        //
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
    public function update(Request $request, $elemento)
    {

        /**
         * PARAMETROS A MODIFICAR
         * progreso
         * completado
         * puntuacion
         */        
        
        if ($request->tipo == 'tema') {
            $tema = Tema::find($elemento);
            $avance = $tema->avances()->where('user_id',Auth::user()->id)->first();

            if (!$avance->completado || $avance->completado == null) {

                $progreso = $this->calcularProgresoTema($tema, Auth::user()->id);
                $puntuacion = $this->calcularPuntuacionTema($tema, Auth::user()->id);

                if ($progreso == 100) {
                    $avance->completado = true;
                }

                $avance->progreso = $progreso;
                $avance->puntuacion = $puntuacion;
                $avance->save();
                $this->actualizarProgresoModulo($tema->modulo,(Auth::user()->id));
                $this->actualizarPuntuacionModulo($tema->modulo,(Auth::user()->id));
                $this->actualizarProgresoCurso($tema->modulo->curso,(Auth::user()->id));
                $this->actualizarPuntuacionCurso($tema->modulo->curso,(Auth::user()->id));

            } 

            //DECIDIR LA RUTA SIGUIENTE.
            $ruta = 'error.404';
            $next = null;
            switch ($request->ultimo) {
                //PARA LOS TEMAS
                case 'si-actividades':
                    $ruta = 'alumno.actividades.show';
                    $next = $tema->actividades()->select('id','numero')->where('status',true)->orderBy('numero')->first();
                    break;
                case 'no-actividades':
                    $rate = Rate::where('rateable_id',$tema->id)->where('rateable_type','App\Models\Tema')->where('user_id',Auth::user()->id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id=$tema->id;
                        $rate->rateable_type='App\Models\Tema';
                        $rate->user_id=Auth::user()->id;
                    }
                    $rate->rate=$request->rate;
                    $rate->save();

                    $ruta = 'alumno.temas.show';
                    $next = $tema->modulo
                    ->temas()
                    ->select('id','numero')
                    ->where('status',true)
                    ->where('numero','>',$tema->numero)
                    ->orderBy('numero')
                    ->first();
                    break;
                case 'ultimo-elemento':
                    $rate = Rate::where('rateable_id',$tema->id)->where('rateable_type','App\Models\Tema')->where('user_id',Auth::user()->id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id = $tema->id;
                        $rate->rateable_type = 'App\Models\Tema';
                        $rate->user_id = Auth::user()->id;
                    }
                    $rate->rate = $request->rate;
                    $rate->save();

                    $ruta = 'alumno.modulos.show';
                    $next = $tema->modulo->curso
                    ->modulos()
                    ->select('id','numero')
                    ->where('status',true)
                    ->where('numero','>',$tema->modulo->numero)
                    ->orderBy('numero')
                    ->first();

                    if (sizeof($next->temas)>0) {
                        $ruta = 'alumno.temas.show';
                        $next = $next->temas()
                        ->select('id','numero')
                        ->where('status',true)
                        ->orderBy('numero')
                        ->first();
                    }
                    break;
                case 'ultimo-modulo-y-elemento':
                    $rate = Rate::where('rateable_id',$tema->id)->where('rateable_type','App\Models\Tema')->where('user_id',Auth::user()->id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id = $tema->id;
                        $rate->rateable_type = 'App\Models\Tema';
                        $rate->user_id = Auth::user()->id;
                    }
                    $rate->rate = $request->rate;
                    $rate->save();

                    //REVISAR SI EXISTE UN FEEDBACK
                    $feedback = $rate->feedback()->select('id','comentario')->first();
                    if ($rate->feedback == null) {
                        $feedback = new Feedback();
                        $feedback->rate_id = $rate->id;
                    }
                    $feedback->comentario = $request->comentario;
                    $feedback->save();

                    $curso = $tema->modulo->curso;
                    return redirect()->route('alumno.cursos.finalizado', $curso);
                    break;
                default:
                    
                    break;
            }
            return redirect()->route($ruta,$next->id);
        } else if ($request->tipo == 'actividad') {
            $actividad = Actividad::find($elemento);
        }

        
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
