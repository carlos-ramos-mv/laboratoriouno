<?php

namespace App\Traits;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Update profile trait
 */
trait PerfilTrait
{
    public function updateProfile(Request $request, User $user)
    {
        $request->validate([
            'ap_pat' => 'max:50',
            'ap_mat' => 'max:50',
            'nombre' => 'max:50',
            'dob' => ['required', 'date', 'before:today'],
        ]);
        DB::beginTransaction();
        try {
            $user->ap_pat = $request->ap_pat;
            $user->ap_mat = $request->ap_mat;
            $user->nombre = $request->nombre;
            $user->dob = $request->dob;

            $user->save();
            DB::commit();
            return true;
        } catch (\Exception $e) {
            DB::rollback();
            return $e->getMessage();
        }
    }
}
