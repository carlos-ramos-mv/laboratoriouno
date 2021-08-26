<?php

namespace App\Traits;

use App\Models\Actividad;
use App\Models\Avance;
use App\Models\Curso;
use App\Models\Modulo;
use App\Models\Rate;
use App\Models\Tema;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

/**
 * Instructor functions
 */
trait InstructorTrait
{
    use PerfilTrait;
    use ActividadTrait;
    use TemaTrait;
    use ModuloTrait;
    use CursoTrait;

    public function renumerarModulos($curso_id, $numero, $id = null)
    {
        DB::beginTransaction();
        try {
            $curso = Curso::find($curso_id);
            if ($id == null) {
                $repetido = $curso->modulos()->select('id')->where('numero', '=', $numero)->first();
            } else {
                $repetido = $curso->modulos()->select('id')->where('numero', '=', $numero)->where('id', '!=', $id)->first();
            }
            if ($repetido != null) {
                $modulos = $curso->modulos()->select('id', 'numero')->where('numero', '>=', $numero)->get();
                foreach ($modulos as $modulo) {
                    $modulo->numero += 1;
                    $modulo->save();
                }
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function renumerarTemas($modulo_id, $numero, $id = null)
    {
        DB::beginTransaction();
        try {
            $modulo = Modulo::find($modulo_id);
            if ($id == null) {
                $repetido = $modulo->temas()->select('id')->where('numero', '=', $numero)->first();
            } else {
                $repetido = $modulo->temas()->select('id')->where('numero', '=', $numero)->where('id', '!=', $id)->first();
            }
            if ($repetido != null) {
                $temas = $modulo->temas()->select('id', 'numero')->where('numero', '>=', $numero)->get();
                foreach ($temas as $tema) {
                    $tema->numero += 1;
                    $tema->save();
                }
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function renumerarActividades($tema_id, $numero, $id = null)
    {
        DB::beginTransaction();
        try {
            $tema = Tema::find($tema_id);
            if ($id == null) {
                $repetido = $tema->temas()->select('id')->where('numero', '=', $numero)->first();
            } else {
                $repetido = $tema->temas()->select('id')->where('numero', '=', $numero)->where('id', '!=', $id)->first();
            }
            if ($repetido != null) {
                $actividades = $tema->actividades()->select('id', 'numero')->where('numero', '>=', $numero)->get();
                foreach ($actividades as $actividad) {
                    $actividad->numero += 1;
                    $actividad->save();
                }
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function deleteActividad(Actividad $actividad)
    {
        DB::beginTransaction();
        try {
            Rate::where('rateable_id', $actividad->id)->where('rateable_type', 'App\Models\Actividad')->delete();
            Avance::where('avanzable_id', $actividad->id)->where('avanzable_type', 'App\Models\Actividad')->delete();
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function deleteTema(Tema $tema)
    {
        DB::beginTransaction();
        try {
            Rate::where('rateable_id', $tema->id)->where('rateable_type', 'App\Models\Tema')->delete();
            Avance::where('avanzable_id', $tema->id)->where('avanzable_type', 'App\Models\Tema')->delete();
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function deleteModulo(Modulo $modulo)
    {
        DB::beginTransaction();
        try {
            Rate::where('rateable_id', $modulo->id)->where('rateable_type', 'App\Models\Modulo')->delete();
            Avance::where('avanzable_id', $modulo->id)->where('avanzable_type', 'App\Models\Modulo')->delete();
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function deleteCurso(Curso $curso)
    {
        DB::beginTransaction();
        try {
            Rate::where('rateable_id', $curso->id)->where('rateable_type', 'App\Models\Curso')->delete();
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }
}
