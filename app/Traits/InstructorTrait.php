<?php

namespace App\Traits;

use App\Models\Curso;
use App\Models\Modulo;

/**
 * Instructor functions
 */
trait InstructorTrait
{
    use PerfilTrait;
    use ModuloTrait;
    use CursoTrait;

    public function renumerarModulos($curso_id, $numero, $id=null)
    {
        $curso = Curso::find($curso_id);
        if ($id==null) {
            $repetido = $curso->modulos()->select('id')->where('numero','=',$numero)->first();
        } else {
            $repetido = $curso->modulos()->select('id')->where('numero','=',$numero)->where('id','!=',$id)->first();
        }
        if ($repetido!=null) {
            $modulos = $curso->modulos()->select('id','numero')->where('numero','>=',$numero)->get();
            foreach ($modulos as $modulo) {
                $modulo->numero += 1;
                $modulo->save();
            }
        }

    }

    public function renumerarTemas($modulo_id, $numero, $id=null)
    {
        $modulo = Modulo::find($modulo_id);
        if ($id==null) {
            $repetido = $modulo->temas()->select('id')->where('numero','=',$numero)->first();
        } else {
            $repetido = $modulo->temas()->select('id')->where('numero','=',$numero)->where('id','!=',$id)->first();
        }
        if ($repetido!=null) {
            $temas = $modulo->temas()->select('id','numero')->where('numero','>=',$numero)->get();
            foreach ($temas as $tema) {
                $tema->numero += 1;
                $tema->save();
            }
        }

    }
}
