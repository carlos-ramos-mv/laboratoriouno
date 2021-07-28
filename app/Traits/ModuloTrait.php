<?php

namespace App\Traits;

use App\Models\Curso;
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
                
                if ($tema->avances()->where('user_id', $user_id)->where('completado', true)->first()!=null) {
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
}
