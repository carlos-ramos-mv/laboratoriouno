<?php
namespace App\Traits;

use App\Models\User;
use Illuminate\Http\Request;

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
        $user->ap_pat = $request->ap_pat;
        $user->ap_mat = $request->ap_mat;
        $user->nombre = $request->nombre;
        $user->dob = $request->dob;

        $user->save();

        return true;
    }
}
