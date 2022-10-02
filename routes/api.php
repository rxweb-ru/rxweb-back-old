<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CasesController;
use App\Http\Controllers\ExteriorsController;
use App\Http\Controllers\GunsController;
use App\Http\Controllers\RaritiesController;
use App\Http\Controllers\SkinsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return 123;
});

/* Оружия */
Route::get('guns', [GunsController::class, 'gunList']);
Route::post('guns/add', [GunsController::class, 'gunAdd']);
Route::delete('guns/delete', [GunsController::class, 'gunDelete']);

/* Износ */
Route::get('rarities', [RaritiesController::class, 'rarityList']);
Route::post('rarities/add', [RaritiesController::class, 'rarityAdd']);
Route::delete('rarities/delete', [RaritiesController::class, 'rarityDelete']);

/* Качество */
Route::get('exteriors', [ExteriorsController::class, 'exteriorsList']);
Route::post('exteriors/add', [ExteriorsController::class, 'exteriorAdd']);
Route::delete('exteriors/delete', [ExteriorsController::class, 'exteriorDelete']);

/* Скины */
Route::get('skins', [SkinsController::class, 'skinList']);
Route::get('skins/get/{id}', [SkinsController::class, 'getSkin']);
Route::post('skins/add', [SkinsController::class, 'skinAdd']);
Route::post('skins/edit/{id}', [SkinsController::class, 'skinEdit']);
Route::post('skins/change-price', [SkinsController::class, 'skinChangePrice']);
Route::delete('skins/delete-image/{id}', [SkinsController::class, 'skinDeleteImage']);
Route::delete('skins/delete', [SkinsController::class, 'skinDelete']);

Route::get('cases', [CasesController::class, 'caseList']);
Route::post('cases/add', [CasesController::class, 'caseAdd']);
Route::delete('cases/delete', [CasesController::class, 'caseDelete']);



Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);