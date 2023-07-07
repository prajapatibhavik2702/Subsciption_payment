<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Auth;

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
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// add

Route::middleware("auth")->group(function () {

    Route::get('plans', [PlanController::class, 'index'])->name('plan');
    Route::get('myplans', [PlanController::class, 'myindex'])->name('myplan');

    Route::get('plans/{plan}', [PlanController::class, 'show'])->name("plans.show");
    Route::post('subscription', [PlanController::class, 'subscription'])->name("subscription.create");
    // Route::post('subscription', [PlanController::class, 'subscription_free'])->name("subscription.create.free");


    Route::get('/testing', [PlanController::class, 'handle']);

});
