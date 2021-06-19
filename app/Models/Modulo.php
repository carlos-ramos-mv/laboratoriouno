<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modulo extends Model
{
    use HasFactory;

    public function temas()
    {
        return $this->hasMany(Tema::class);
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class);
    }

    public function avances()
    {
        return $this->morphMany(Avance::class, 'avanzable');
    }

    public function actualizarPorcentajeModulo($user_id){ 
        
        $temasTotal = sizeof($this->temas);
        if ($temasTotal>0) {
            $temasCompletados = 0;
            foreach ($this->temas as $tema) {
                
                if (sizeof($tema->avances()->where('user_id', $user_id)->where('completado', true)->get())==1) {
                    $temasCompletados++;
                }
                
            }

            $progreso = round(($temasCompletados*100/$temasTotal),2);

            $avance = $this->avances()->where('user_id',$user_id)->first();
            $avance->progreso = $progreso;

            if ($progreso==100) {
                $avance->completado = true;
            }

            $avance->save();
        }
        
    }

    public function actualizarPuntuacionModulo($user_id){ 
        
        $temas = $this->temas()->select('id');
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

            $avance = $this->avances()->where('user_id',$user_id)->first();
            $avance->puntuacion = $promedio;

            $avance->save();    
        }

    }
}
