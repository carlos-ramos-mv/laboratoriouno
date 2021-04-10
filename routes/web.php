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

//Curso Route
Route::get('/curso/{curso}', function ($curso) {
    return view('curso');
})->name('curso');

//Update User Details
Route::post('/update-profile/{id}', [App\Http\Controllers\HomeController::class, 'updateProfile'])->name('updateProfile');
Route::post('/update-password/{id}', [App\Http\Controllers\HomeController::class, 'updatePassword'])->name('updatePassword');

//Language Translation
Route::get('index/{locale}', [App\Http\Controllers\HomeController::class, 'lang']);

//Any Route
Route::get('{any}', [HomeController::class, 'any'])->name('any');



