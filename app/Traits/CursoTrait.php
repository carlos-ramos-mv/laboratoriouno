<?php

namespace App\Traits;

use App\Models\Curso;

/**
 * Métodos para los cursos
 */

trait CursoTrait
{

    public function actualizarProgresoCurso(Curso $curso, $user_id){ 
        
        $modulosTotal = sizeof($curso->modulos);
        if ($modulosTotal>0) {
            $modulosPorcentaje = 0;
            foreach ($curso->modulos()->where('status',true)->get() as $modulo) {
                $a = $modulo->avances()->select('progreso')->where('user_id',$user_id)->first();
                $modulosPorcentaje += $a->progreso;
            }

            $progreso = round(($modulosPorcentaje/$modulosTotal),2);

            $curso->users()->updateExistingPivot($user_id,['progreso'=>$progreso],false);

            if ($progreso==100) {
                $curso->users()->updateExistingPivot($user_id,['completado'=>true],false);
            }
        }
        
    }

}
