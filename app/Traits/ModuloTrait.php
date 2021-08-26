<?php

namespace App\Traits;

use App\Models\Curso;
use App\Models\Modulo;
use Illuminate\Support\Facades\DB;

/**
 * 
 */
trait ModuloTrait
{
    public function actualizarProgresoModulo(Modulo $modulo, $user_id)
    {
        DB::beginTransaction();
        try {
            $temasTotal = sizeof($modulo->temas);
            if ($temasTotal > 0) {
                $temasCompletados = 0;
                foreach ($modulo->temas as $tema) {
                    if ($tema->avances()->where('user_id', $user_id)->where('completado', true)->first() != null) {
                        $temasCompletados++;
                    }
                }
                $progreso = round(($temasCompletados * 100 / $temasTotal), 2);

                $avance = $modulo->avances()->where('user_id', $user_id)->first();
                $avance->progreso = $progreso;

                if ($progreso == 100) {
                    $avance->completado = true;
                }

                $avance->save();
            }
            DB::commit();
            return true;
        } catch (\Exception $e) {
            DB::rollback();
            return $e->getMessage();
        }
    }
}
