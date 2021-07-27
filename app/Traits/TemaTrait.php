<?php

namespace App\Traits;

use App\Models\Feedback;
use App\Models\Rate;
use App\Models\Tema;
use Illuminate\Support\Facades\Auth;

/**
 * 
 */
trait TemaTrait
{

    public function actualizarPorcentajeTema(Tema $tema, $user_id){ 

        $progreso = $this->calcularProgresoTema($tema,$user_id);

        $avance = $tema->avances()->where('user_id',$user_id)->get();
        $avance->progreso = $progreso;

        if ($progreso==100) {
            $avance->completado = true;
        }

        $avance->save();
        
    }

    public function actualizarPuntuacionTema(Tema $tema, $user_id){ 

        $promedio = $this->calcularPuntuacionTema($tema,$user_id);

        $avance = $tema->avances()->where('user_id',$user_id)->get();
        $avance->puntuacion = $promedio;

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

    public function calcularPuntuacionTema(Tema $tema, $user_id)
    {
        if (sizeof($tema->actividades)>0) {
            $nAct = 0;;
            $sumatoria = 0;
            $actividades = $tema->actividades;
            foreach ($actividades as $actividad) {
                $p = $actividad->avances()->select('puntuacion')->where('user_id',$user_id)->where('completado',true)->where('puntuacion','!=',null)->first();
                if ($p!=null) {
                    $sumatoria = $sumatoria + $p->puntuacion;
                    $nAct++;
                }
                
            }
            $puntuacion = round(($sumatoria/$nAct),2);
            return $puntuacion;
        } else {
            return $puntuacion = 10;
        }
    }

    public function rutaSiguienteTema($request,$tema)
    {
        
    }
}
