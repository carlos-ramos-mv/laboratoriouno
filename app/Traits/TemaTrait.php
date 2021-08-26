<?php

namespace App\Traits;

use App\Models\Tema;
use Illuminate\Support\Facades\DB;

/**
 * 
 */
trait TemaTrait
{
    public function actualizarProgresoTema(Tema $tema, $user_id)
    {
        DB::beginTransaction();
        try {
            $progreso = $this->calcularProgresoTema($tema, $user_id);

            $avance = $tema->avances()->where('user_id', $user_id)->get();
            $avance->progreso = $progreso;

            if ($progreso == 100) {
                $avance->completado = true;
            }
            $avance->save();

            DB::commit();
            return true;
        } catch (\Exception $e) {
            DB::rollback();
            return $e->getMessage();
        }
    }

    public function calcularProgresoTema(Tema $tema, $user_id)
    {
        if (sizeof($tema->actividades) > 0) {
            $nAct = sizeof($tema->actividades);
            $completadas = 0;
            $actividades = $tema->actividades;
            foreach ($actividades as $actividad) {
                $a = $actividad->avances()->select('completado')->where('user_id', $user_id)->first();
                if ($a) {
                    $completadas++;
                }
            }
            $progreso = $completadas * 100 / $nAct;
            return $progreso;
        } else {
            return $progreso = 100;
        }
    }

    /* public function renumerarTemas(Modulo $modulo, $numero)
    {
        DB::beginTransaction();
        try {
            $repetido = $modulo->temas()->select('id')->where('numero', '=', $numero)->first();
            if ($repetido != null) {
                $temas = $modulo->temas()->select('id', 'numero')->where('numero', '>=', $numero)->get();
                foreach ($temas as $tema) {
                    $tema->numero += 1;
                    $tema->save();
                }
            }
            DB::commit();
            return true;
        } catch (\Exception $e) {
            DB::rollback();
            return $e->getMessage();
        }
    } */
}
