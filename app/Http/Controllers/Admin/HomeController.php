<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Traits\AdminTrait;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    use AdminTrait;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('admin.home');
    }

    public function publicar()  
    {
        $cursos = $this->getAllCursos();
        return view('admin.publicar',compact('cursos'));
    }

    public function perfil()
    {
        return view('admin.perfil');
    }

    public function update(Request $request)
    {

        $s = $this->updateProfile($request, Auth::user());

        if ($s) {
            if (Auth::user()->hasRole('Admin')) {
                return redirect()->route('admin.home')->with('perfil-updated','¡Perfil actualizado con éxito!');    
            } else if (Auth::user()->hasRole('Instructor')) {
                return redirect()->route('instructor.home')->with('perfil-updated','¡Perfil actualizado con éxito!');
            }
        } else {
            return "No se pudo actualizar el perfil. Intenta más tarde.";
        }
        
        
    }

    public function backup()
    {
        $query = " SELECT table_name
        FROM information_schema.tables
       WHERE table_schema='public'
         AND table_type='BASE TABLE';";
        $table_name = DB::select($query);
        $tables = [];
        foreach ($table_name as $table) {
            $tables[] = $table->table_name;
        }

        return view('admin.backup', compact('tables'));
    }

    public function restore()
    {
        return view('admin.restore');
    }

    public function backupStore(Request $request)
    {
        // $output = null;
        // $status = null;
        // $result = exec('C:\xampp\htdocs\laboratoriouno\backup\backup.py',$output,$satus);
        // shell_exec("py C:\xampp\htdocs\laboratoriouno\backup\backup.py ");

        $command = 'py C:\xampp\htdocs\laboratoriouno\backup\backup.py -db laboratoriouno';
        //pclose(popen($command,'r'));

        $output = shell_exec($command);
        
        return $request->all();
    }

    public function restoreStore()
    {
        #code...
    }
}
