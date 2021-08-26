<?php

namespace App\Traits;

use App\Models\Avance;
use App\Models\Curso;
use App\Models\Rate;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

/**
 * Admin functions
 */
trait AdminTrait
{


    public function deleteUser(User $user)
    {
        $roles = $user->getRoleNames();
        foreach ($roles as $role) {
            DB::beginTransaction();
            try {

                DB::commit();
            } catch (\Exception $e) {
                Log::error($e->getMessage());
                DB::rollBack();
            }
            $user->removeRole($role);
        }
    }

    public function getAllCursos()
    {
        $cursos = Curso::select('id', 'nombre', 'status')->get();
        foreach ($cursos as $curso) {
            $modulos = $curso->modulos()->select('id', 'titulo', 'status')->get();
            foreach ($modulos as $modulo) {
                $temas = $modulo->temas()->select('titulo', 'status', 'id')->orderBy('id', 'asc')->get();
                foreach ($temas as $tema) {
                    $tema->actividades()->select('id', 'titulo', 'status')->get();
                }
            }
        }
        return $cursos;
    }
}
