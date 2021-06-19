<?php

namespace App\Traits;

use App\Models\Curso;

/**
 * Métodos para los cursos
 */

trait CrusoTrait
{

    public function actualizarPorcentajeCurso(Curso $curso, $user_id){ 
        
        $modulosTotal = sizeof($curso->modulos);
        if ($modulosTotal>0) {
            $modulosCompletados = 0;
            foreach ($curso->modulos as $modulo) {
                
                if (sizeof($modulo->avances()->where('user_id', $user_id)->where('completado', true)->get())==1) {
                    $modulosCompletados++;
                }
                
            }

            $progreso = round(($modulosCompletados*100/$modulosTotal),2);

            $curso->users()->updateExistingPivot($user_id,['progreso'=>$progreso],false);

            if ($progreso==100) {
                $curso->users()->updateExistingPivot($user_id,['completado'=>true],false);
            }
        }
        
    }

    public function actualizarPuntuacionCurso(Curso $curso, $user_id){ 
        
        $modulos = $curso->modulos()->select('id');
        if (sizeof($modulos)>0) {
            $modulosCalificados = 0;
            $puntuacionTotal = 0;

            foreach ($modulos as $modulo) {
                $consulta = $modulo->avances()->select('puntuacion')->where('user_id', $user_id)->get();
                if (sizeof($consulta)==1) {
                    $puntuacion = $consulta[0]->puntuacion;
                    if ($puntuacion!=null) {
                        $modulosCalificados++;
                        $puntuacionTotal = $puntuacionTotal + $puntuacion;
                    }
                    
                }
            }

            $promedio = round(($puntuacionTotal/$modulosCalificados),2);

            $curso->users()->updateExistingPivot($user_id,['puntuacion'=>$promedio],false);
 
        }

    }

}
