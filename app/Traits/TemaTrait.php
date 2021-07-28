<?php

namespace App\Traits;

use App\Models\Feedback;
use App\Models\Modulo;
use App\Models\Rate;
use App\Models\Tema;
use Illuminate\Support\Facades\Auth;

/**
 * 
 */
trait TemaTrait
{

    public function actualizarProgresoTema(Tema $tema, $user_id){ 

        $progreso = $this->calcularProgresoTema($tema,$user_id);

        $avance = $tema->avances()->where('user_id',$user_id)->get();
        $avance->progreso = $progreso;

        if ($progreso==100) {
            $avance->completado = true;
        }

        $avance->save();
        
    }

    public function calcularProgresoTema(Tema $tema, $user_id)
    {
        if (sizeof($tema->actividades)>0) {
            $nAct = sizeof($tema->actividades);
            $completadas = 0;
            $actividades = $tema->actividades;
            foreach ($actividades as $actividad) {
                $a = $actividad->avances()->select('completado')->where('user_id',$user_id)->first();
                if ($a) {
                    $completadas++;
                }
            }
            $progreso = $completadas*100/$nAct;
            return $progreso;
        } else {
            return $progreso = 100;
        }
    }

    public function renumerarTemas(Modulo $modulo, $numero)
    {
        $repetido = $modulo->temas()->select('id')->where('numero','=',$numero)->first();
        if ($repetido!=null) {
            $temas = $modulo->temas()->select('id','numero')->where('numero','>=',$numero)->get();
            foreach ($temas as $tema) {
                $tema->numero += 1;
                $tema->save();
            }
        }

    }
}
