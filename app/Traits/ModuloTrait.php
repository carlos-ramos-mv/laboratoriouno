<?php

namespace App\Traits;

use App\Models\Modulo;

/**
 * 
 */
trait ModuloTrait
{
    public function actualizarProgresoModulo(Modulo $modulo, $user_id){ 
        
        $temasTotal = sizeof($modulo->temas);
        if ($temasTotal>0) {
            $temasCompletados = 0;
            foreach ($modulo->temas as $tema) {
                
                if (sizeof($tema->avances()->where('user_id', $user_id)->where('completado', true)->get())==1) {
                    $temasCompletados++;
                }
                
            }

            $progreso = round(($temasCompletados*100/$temasTotal),2);

            $avance = $modulo->avances()->where('user_id',$user_id)->first();
            $avance->progreso = $progreso;

            if ($progreso==100) {
                $avance->completado = true;
            }

            $avance->save();
        }
        
    }

    public function actualizarPuntuacionModulo(Modulo $modulo, $user_id){ 
        
        $temas = $modulo->temas()->select('id')->get();
        if (sizeof($temas)>0) {
            $temasCalificados = 0;
            $puntuacionTotal = 0;

            foreach ($temas as $tema) {
                $consulta = $tema->avances()->select('puntuacion')->where('user_id', $user_id)->get();
                if (sizeof($consulta)==1) {
                    $puntuacion = $consulta[0]->puntuacion;
                    if ($puntuacion!=null) {
                        $temasCalificados++;
                        $puntuacionTotal = $puntuacionTotal + $puntuacion;
                    }
                    
                }
            }

            $promedio = round(($puntuacionTotal/$temasCalificados),2);

            $avance = $modulo->avances()->where('user_id',$user_id)->first();
            $avance->puntuacion = $promedio;

            $avance->save();    
        }

    }
}
