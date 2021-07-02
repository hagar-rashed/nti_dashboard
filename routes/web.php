<?php

use App\Http\Controllers\dashboard\home\HomeController;
use App\Http\Controllers\dashboard\products\ProductController;
use App\Http\Controllers\UserController;
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

Route::get('/', function () {
    return view('welcome');
});



Route::group(['prefix' => 'home'], function () {
    Route::get('login', [UserController::class, 'loginform'])->name('login');
    Route::get('user-register', [Usercontroller::class, 'registerform'])->name('user.register');
    Route::get('users', [UserController::class, 'allUsers'])->name('users.all');
    Route::get('back',[UserController::class,'back'])->name('back');
    Route::get('/', [HomeController::class, 'index']);
    Route::resource('products', ProductController::class);
});



// Route::get('all-products',[ProductController::class,'index']);

// Route::get('add-products',[ProductController::class,'create']);
// Route::post('add-products',[ProductController::class,'add']);


// Route::get('edit-products',[ProductController::class,'edit']);
// Route::put('edit-products',[ProductController::class,'update']);

// Route::delete('delete-product',[ProductController::class,'destory']);
