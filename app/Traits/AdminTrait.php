<?php

namespace App\Traits;

use App\Models\Curso;

/**
 * Admin functions
 */
trait AdminTrait
{

    public function getAllCursos()
    {
        $cursos = Curso::select('id','nombre','status')->get();
        foreach ($cursos as $curso ) {
            $modulos = $curso->modulos()->select('id','titulo','status')->get();
            foreach ($modulos as $modulo) {
                $temas = $modulo->temas()->select('titulo','status','id')->orderBy('id','asc')->get();
                foreach ($temas as $tema ) {
                    $tema->actividades()->select('id','titulo','status')->get();
                }
            }
        }
        return $cursos;
    }
}
