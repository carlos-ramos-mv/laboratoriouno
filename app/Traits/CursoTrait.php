<?php

namespace App\Traits;

use App\Models\Curso;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use SebastianBergmann\Environment\Console;

/**
 * Métodos para los cursos
 */

trait CursoTrait
{

    public function calcularRateCurso(Curso $curso)
    {
        $rates = $curso->rates;
        if (sizeof($rates) > 0) {
            $sum = 0;
            foreach ($rates as $rate) {
                $sum += $rate->rate;
            }
            $prom = round(($sum / sizeof($rates)),1);
            return $prom;
        }
        return 0;
    }

    public function actualizarProgresoCurso(Curso $curso, $user_id)
    {
        DB::beginTransaction();
        try {
            $modulosTotal = sizeof($curso->modulos);
            if ($modulosTotal > 0) {
                $modulosPorcentaje = 0;

                foreach ($curso->modulos()->where('status', true)->get() as $modulo) {
                    $a = $modulo->avances()->select('progreso')->where('user_id', $user_id)->first();
                    $modulosPorcentaje += $a->progreso;
                }

                $progreso = round(($modulosPorcentaje / $modulosTotal), 2);
                $curso->users()->updateExistingPivot($user_id, ['progreso' => $progreso], false);

                if ($progreso == 100) {
                    $curso->users()->updateExistingPivot($user_id, ['completado' => true], false);
                }
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollback();
            Log::error($e->getMessage());
        }
    }
}
