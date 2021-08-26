<?php

namespace App\Traits;

use App\Http\Controllers\Alumno\CursoController;
use App\Models\Avance;
use App\Models\Curso;
use App\Models\Feedback;
use App\Models\Modulo;
use App\Models\Rate;
use App\Models\Tema;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

/**
 * Acciones del alumno
 */
trait AlumnoTrait
{

    use PerfilTrait;
    use TemaTrait;
    use ModuloTrait;
    use CursoTrait;

    public function inscripcion(Curso $curso, User $user)
    {
        DB::beginTransaction();
        try {
            $user->cursos()->attach($curso, ['progreso' => 0, 'completado' => false]);
            $this->crearAvances($curso, $user->id);
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }
    //Metodo que crea los avances correspondientes al usuario
    //Se crean avances para los módulos, temas y actividades pertenecientes al curso
    private function crearAvances(Curso $curso, $user_id)
    {
        DB::beginTransaction();
        try {
            $avance = new Avance();
            if (sizeof($curso->modulos) > 0) {
                $modulos = $curso->modulos()->select('id')->get();
                foreach ($modulos as $modulo) {
                    if (sizeof($modulo->temas) > 0) {
                        $temas = $modulo->temas()->select('id')->get();
                        foreach ($temas as $tema) {
                            if (sizeof($tema->actividades) > 0) {
                                $actividades = $tema->actividades()->select('id')->get();
                                foreach ($actividades as $actividad) {
                                    $avance->avanzable_id = $actividad->id;
                                    $avance->avanzable_type = 'App\Models\Actividad';
                                    $avance->user_id = $user_id;
                                    $avance->progreso = 0;

                                    $avance->save();
                                    $avance = new Avance();
                                }
                            }
                            $avance->avanzable_id = $tema->id;
                            $avance->avanzable_type = 'App\Models\Tema';
                            $avance->user_id = $user_id;
                            $avance->progreso = 0;

                            $avance->save();
                            $avance = new Avance();
                        }
                    }
                    $avance->avanzable_id = $modulo->id;
                    $avance->avanzable_type = 'App\Models\Modulo';
                    $avance->user_id = $user_id;
                    $avance->progreso = 0;

                    $avance->save();
                    $avance = new Avance();
                }
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function actualizarPuntuacionTema(Tema $tema, $user_id)
    {
        DB::beginTransaction();
        try {
            $promedio = $this->calcularPuntuacionTema($tema, $user_id);
            $avance = $tema->avances()->where('user_id', $user_id)->get();
            $avance->puntuacion = $promedio;
            $avance->save();

            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function calcularPuntuacionTema(Tema $tema, $user_id)
    {
        if (sizeof($tema->actividades) > 0) {
            $nAct = 0;;
            $sumatoria = 0;
            $actividades = $tema->actividades;
            foreach ($actividades as $actividad) {
                $p = $actividad->avances()->select('puntuacion')->where('user_id', $user_id)->where('completado', true)->where('puntuacion', '!=', null)->first();
                if ($p != null) {
                    $sumatoria = $sumatoria + $p->puntuacion;
                    $nAct++;
                }
            }
            $puntuacion = round(($sumatoria / $nAct), 2);
            return $puntuacion;
        } else {
            return $puntuacion = 10;
        }
    }

    public function actualizarPuntuacionModulo(Modulo $modulo, $user_id)
    {
        DB::beginTransaction();
        try {
            $temas = $modulo->temas()->select('id')->get();
            if (sizeof($temas) > 0) {
                $temasCalificados = 0;
                $puntuacionTotal = 0;

                foreach ($temas as $tema) {
                    $consulta = $tema->avances()->select('puntuacion')->where('user_id', $user_id)->get();
                    if (sizeof($consulta) == 1) {
                        $puntuacion = $consulta[0]->puntuacion;
                        if ($puntuacion != null) {
                            $temasCalificados++;
                            $puntuacionTotal = $puntuacionTotal + $puntuacion;
                        }
                    }
                }
                $promedio = round(($puntuacionTotal / $temasCalificados), 2);

                $avance = $modulo->avances()->where('user_id', $user_id)->first();
                $avance->puntuacion = $promedio;
                $avance->save();
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function actualizarPuntuacionCurso(Curso $curso, $user_id)
    {
        DB::beginTransaction();
        try {
            $modulos = $curso->modulos()->select('id')->get();
            if (sizeof($modulos) > 0) {
                $modulosCalificados = 0;
                $puntuacionTotal = 0;

                foreach ($modulos as $modulo) {
                    $a = $modulo->avances()->select('puntuacion')->where('user_id', $user_id)->first();
                    if ($a != null) {
                        $puntuacion = $a->puntuacion;
                        if ($puntuacion != null) {
                            $modulosCalificados++;
                            $puntuacionTotal = $puntuacionTotal + $puntuacion;
                        }
                    }
                }
                $promedio = round(($puntuacionTotal / $modulosCalificados), 2);
                $curso->users()->updateExistingPivot($user_id, ['puntuacion' => $promedio], false);
            }
            DB::commit();
            Log::info("Done");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage());
        }
    }

    public function avanceTema(Request $request, Tema $tema, $user_id)
    {
        /**
         * PARAMETROS A MODIFICAR
         * progreso
         * completado
         * puntuacion
         */
        DB::beginTransaction();
        try {
            $avance = $tema->avances()->where('user_id', $user_id)->first();
            if (!$avance->completado || $avance->completado == null) {
                $progreso = $this->calcularProgresoTema($tema, $user_id);
                $puntuacion = $this->calcularPuntuacionTema($tema, $user_id);

                if ($progreso == 100) {
                    $avance->completado = true;
                }

                $avance->progreso = $progreso;
                $avance->puntuacion = $puntuacion;
                $avance->save();
                $this->actualizarProgresoModulo($tema->modulo, ($user_id));
                $this->actualizarPuntuacionModulo($tema->modulo, ($user_id));
                $this->actualizarProgresoCurso($tema->modulo->curso, ($user_id));
                $this->actualizarPuntuacionCurso($tema->modulo->curso, ($user_id));
            }

            //DECIDIR LA RUTA SIGUIENTE.
            $ruta = 'error.404';
            $next = null;
            switch ($request->ultimo) {
                    //PARA LOS TEMAS
                case 'si-actividades':
                    $ruta = 'alumno.actividades.show';
                    $next = $tema->actividades()->select('id', 'numero')->where('status', true)->orderBy('numero')->first();
                    break;
                case 'no-actividades':
                    $rate = Rate::where('rateable_id', $tema->id)->where('rateable_type', 'App\Models\Tema')->where('user_id', $user_id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id = $tema->id;
                        $rate->rateable_type = 'App\Models\Tema';
                        $rate->user_id = $user_id;
                    }
                    $rate->rate = $request->rate;
                    $rate->save();

                    $ruta = 'alumno.temas.show';
                    $next = $tema->modulo
                        ->temas()
                        ->select('id', 'numero')
                        ->where('status', true)
                        ->where('numero', '>', $tema->numero)
                        ->orderBy('numero')
                        ->first();
                    break;
                case 'ultimo-elemento':
                    $rate = Rate::where('rateable_id', $tema->id)->where('rateable_type', 'App\Models\Tema')->where('user_id', $user_id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id = $tema->id;
                        $rate->rateable_type = 'App\Models\Tema';
                        $rate->user_id = $user_id;
                    }
                    $rate->rate = $request->rate;
                    $rate->save();

                    $ruta = 'alumno.modulos.show';
                    $next = $tema->modulo->curso
                        ->modulos()
                        ->select('id', 'numero')
                        ->where('status', true)
                        ->where('numero', '>', $tema->modulo->numero)
                        ->orderBy('numero')
                        ->first();

                    if (sizeof($next->temas) > 0) {
                        $ruta = 'alumno.temas.show';
                        $next = $next->temas()
                            ->select('id', 'numero')
                            ->where('status', true)
                            ->orderBy('numero')
                            ->first();
                    }
                    break;
                case 'ultimo-modulo-y-elemento':
                    $rate = Rate::where('rateable_id', $tema->id)->where('rateable_type', 'App\Models\Tema')->where('user_id', $user_id)->first();

                    if ($rate == null) {
                        $rate = new Rate();
                        $rate->rateable_id = $tema->id;
                        $rate->rateable_type = 'App\Models\Tema';
                        $rate->user_id = $user_id;
                    }
                    $rate->rate = $request->rate;
                    $rate->save();

                    //REVISAR SI EXISTE UN FEEDBACK
                    $feedback = $rate->feedback()->select('id', 'comentario')->first();
                    if ($rate->feedback == null) {
                        $feedback = new Feedback();
                        $feedback->rate_id = $rate->id;
                    }
                    $feedback->comentario = $request->comentario;
                    $feedback->save();

                    $next = $tema->modulo->curso;
                    $ruta = 'alumno.cursos.finalizado';
                    break;
                default:

                    break;
            }
            DB::commit();
            Log::info("Done");
            return ['ruta' => $ruta, 'next' => $next];
        } catch (\Exception $e) {
            DB::rollback();
            Log::error($e->getMessage());
            return false;
        }
    }
}
