<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Curso;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('admin.home');
    }

    public function publicar()  
    {
        $cursos = $this->getCursos();
        return view('admin.publicar',compact('cursos'));
    }

    private function getCursos()
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

    public function perfil()
    {
        return view('admin.perfil');
    }

    public function update(Request $request)
    {

        $request->validate([
            'ap_pat' => 'max:50',
            'ap_mat' => 'max:50',
            'nombre' => 'max:50',
            'dob' => ['required', 'date', 'before:today'],
        ]);
        $user = User::find(Auth::user()->id);

        $user->ap_pat = $request->ap_pat;
        $user->ap_mat = $request->ap_mat;
        $user->nombre = $request->nombre;

        $user->save();

        if ($user->hasRole('Admin')) {
            return redirect()->route('admin.home')->with('perfil-updated','¡Perfil actualizado con éxito!');    
        } else if ($user->hasRole('Instructor')) {
            return redirect()->route('instructor.home')->with('perfil-updated','¡Perfil actualizado con éxito!');
        }
        
    }

    public function backup()
    {
        return view('admin.backup');
    }

    public function restore()
    {
        return view('admin.restore');
    }

    public function backupStore(Request $request)
    {
        return $request->all();
    }

    public function restoreStore()
    {
        return view('admin.restore');
    }
}
