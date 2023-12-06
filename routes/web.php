<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('/home');
});

Auth::routes(['verify' => true]);
// /login /register, etc.
// and verify email

Route::middleware('verified')->group(function () {
    Route::get('/home/reserved', [App\Http\Controllers\HomeController::class, 'reserved'])->name('home.reserved');
    Route::post('/home/reserved/cancel/{id}', [App\Http\Controllers\HomeController::class, 'cancel'])->name('reservation.cancel');
    Route::post('/home/reserved/uncancel/{id}', [App\Http\Controllers\HomeController::class, 'uncancel'])->name('reservation.uncancel');
    Route::post('/home/{hotel}/{room}', [App\Http\Controllers\HomeController::class, 'processForm'])->name('home.book')->where(['dates' => "[\w/-]+"]);
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'hotels'])->name('home');
Route::get('/home/{hotel}', [App\Http\Controllers\HomeController::class, 'hotel'])->name('home.hotel');
Route::get('/home/{hotel}/{room}', [App\Http\Controllers\HomeController::class, 'room'])->name('home.room')->where(['dates' => "[\w/-]+"]);

Route::prefix('admin')->middleware(['verified', 'isAdmin'])->group(function () {
    Route::get('/dashboard', [AdminController::class, 'reserved'])->name('admin.dashboard');
});