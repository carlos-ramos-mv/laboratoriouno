<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\InicioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Auth::routes(['verify' => true]);

//PÁGINA DE INICIO
Route::get('/', [InicioController::class, 'root'])->name('root');

//Index Route
Route::get('/index', [App\Http\Controllers\HomeController::class, 'index'])->name('index');

//STATUS
Route::get('/status', [HomeController::class, 'status'])->name('status');

//ADMIN
Route::middleware(['auth', 'status'])->group(function () {
    Route::group(['middleware' => ['role:Admin']],function ()
    {
        Route::get('/admin', [App\Http\Controllers\Admin\HomeController::class, 'index'])->name('admin.home');
        Route::get('/admin/perfil', [App\Http\Controllers\Admin\HomeController::class, 'perfil'])->name('admin.perfil');
        Route::put('/admin/update', [App\Http\Controllers\Admin\HomeController::class, 'update'])->name('admin.update');
        Route::get('/admin/backup', [App\Http\Controllers\Admin\HomeController::class, 'backup'])->name('admin.backup');
        Route::post('/admin/restore', [App\Http\Controllers\Admin\HomeController::class, 'restoreStore'])->name('admin.restore.store');
        Route::post('/admin/backup', [App\Http\Controllers\Admin\HomeController::class, 'backupStore'])->name('admin.backup.store');
        Route::get('/admin/restore', [App\Http\Controllers\Admin\HomeController::class, 'restore'])->name('admin.restore');
        Route::resource('/admin/cursos', App\Http\Controllers\Admin\CursoController::class)->names('admin.cursos');
        Route::get('/admin/publicar', [App\Http\Controllers\Admin\HomeController::class, 'publicar'])->name('admin.publicar');
        Route::resource('/admin/modulos', App\Http\Controllers\Admin\ModuloController::class)->names('admin.modulos');
        Route::resource('/admin/temas', App\Http\Controllers\Admin\TemaController::class)->names('admin.temas');
        Route::resource('/admin/actividades', App\Http\Controllers\Admin\ActividadController::class)->parameters(['actividades' => 'actividad'])->names('admin.actividades');
        Route::resource('/admin/alumnos', App\Http\Controllers\Admin\AlumnoController::class)->names('admin.alumnos');
        Route::resource('/admin/instructores', App\Http\Controllers\Admin\InstructorController::class)->parameters(['instructores' => 'instructor'])->names('admin.instructores');
        Route::get('/admin/instructores/activar', [App\Http\Controllers\Admin\InstructorController::class, 'activar'])->name('admin.instructores.activar');
    });

    Route::group(['middleware' => ['role:Instructor']],function ()
    {
        Route::get('/instructor', [App\Http\Controllers\Admin\HomeController::class, 'index'])->name('instructor.home');
        Route::get('/instructor/perfil', [App\Http\Controllers\Admin\HomeController::class, 'perfil'])->name('instructor.perfil');
        Route::put('/instructor/update', [App\Http\Controllers\Admin\HomeController::class, 'update'])->name('instructor.update');
        Route::resource('/instructor/cursos', App\Http\Controllers\Admin\CursoController::class)->names('instructor.cursos');
        Route::get('/instructor/publicar', [App\Http\Controllers\Admin\HomeController::class, 'publicar'])->name('instructor.publicar');
        Route::resource('/instructor/modulos', App\Http\Controllers\Admin\ModuloController::class)->names('instructor.modulos');
        Route::resource('/instructor/temas', App\Http\Controllers\Admin\TemaController::class)->names('instructor.temas');
        Route::resource('/instructor/actividades', App\Http\Controllers\Admin\ActividadController::class)->names('instructor.actividades');
    });
});

//ALUMNO
Route::group(['middleware' => ['role:Alumno']],function ()
{
    Route::get('/alumno', [App\Http\Controllers\Alumno\HomeController::class, 'index'])->name('alumno.home');
    Route::get('/alumno/perfil', [App\Http\Controllers\Alumno\HomeController::class, 'perfil'])->name('alumno.perfil');
    Route::put('/alumno/update', [App\Http\Controllers\Alumno\HomeController::class, 'update'])->name('alumno.update');
    Route::get('/alumno/cursos/inscribirse/{curso}', [App\Http\Controllers\Alumno\CursoController::class, 'inscribirse'])->name('alumno.cursos.inscribirse');
    Route::get('/alumno/cursos/finalizado/{curso}', [App\Http\Controllers\Alumno\CursoController::class, 'finalizado'])->name('alumno.cursos.finalizado');
    Route::get('/alumno/cursos/{curso}', [App\Http\Controllers\Alumno\CursoController::class, 'show'])->name('alumno.cursos.show');
    Route::get('/alumno/cursos', [App\Http\Controllers\Alumno\CursoController::class, 'index'])->name('alumno.cursos.index');
    Route::get('/alumno/modulos/{modulo}', [App\Http\Controllers\Alumno\ModuloController::class, 'show'])->name('alumno.modulos.show');
    Route::get('/alumno/temas/{tema}', [App\Http\Controllers\Alumno\TemaController::class, 'show'])->name('alumno.temas.show');
    Route::put('/alumno/avances/{id}', [App\Http\Controllers\Alumno\AvanceController::class, 'update'])->name('alumno.avances.update');
    Route::get('/alumno/actividades/{actividad}', [App\Http\Controllers\Alumno\ActividadController::class, 'show'])->name('alumno.actividades.show');
});


//Update User Details
Route::post('/update-profile/{id}', [App\Http\Controllers\HomeController::class, 'updateProfile'])->name('updateProfile');
Route::post('/update-password/{id}', [App\Http\Controllers\HomeController::class, 'updatePassword'])->name('updatePassword');

//Language Translation
Route::get('index/{locale}', [App\Http\Controllers\HomeController::class, 'lang']);

//Any Route
Route::get('{any}', [HomeController::class, 'any'])->name('any');
