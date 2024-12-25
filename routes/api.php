<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
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
    return $request->user();
});

Route::group(['middleware' => ['cors', 'json.response']], function () {
    Route::post('/login','App\Http\Controllers\Auth\ApiAuthController@login')->name('login.api');
    Route::post('/register','App\Http\Controllers\Auth\ApiAuthController@register')->name('register.api');
    Route::post('/partner/recovery','App\Http\Controllers\Auth\ApiAuthController@recover')->name('partnet.recover.api');
    
    Route::get('/cities/{cid}', 'App\Http\Controllers\CommonServices@cities')->name('common.service.cities');
    Route::get('/countries', 'App\Http\Controllers\CommonServices@countries')->name('common.service.counries');
    Route::get('/status', 'App\Http\Controllers\CommonServices@status')->name('common.service.status');
    
    
    
    Route::get('/artisan', function(){
        \Artisan::call('make:resource SearchItemCollection');
    });
    
     Route::middleware('api')->group(function () {
         Route::get('/search', 'App\Http\Controllers\Search@get')->name('search.get');
         Route::get('/property/single/{id}', 'App\Http\Controllers\Search@getProperty')->name('search.get.property');
         Route::get('/check-price', 'App\Http\Controllers\Search@getPrice')->name('search.get.property');
         
         Route::post('/booking/create', 'App\Http\Controllers\Bookings@create')->name('booking.create');
     });
    
    Route::middleware('auth:api')->group(function () {
        // our routes to be protected will go in here
        Route::post('/logout', 'App\Http\Controllers\Auth\ApiAuthController@logout')->name('logout.api');
        Route::get('/profile', 'App\Http\Controllers\Auth\ApiAuthController@profile')->name('logout.api');
        Route::post('/chpw','App\Http\Controllers\Auth\ApiAuthController@change_password')->name('login.api');

        // Property Endpoints
        Route::post('/property', 'App\Http\Controllers\Properties@create')->name('property.create');
        Route::get('/property', 'App\Http\Controllers\Properties@get')->name('property.get');
        Route::get('/property/delete', 'App\Http\Controllers\Properties@delete')->name('property.get');
        Route::get('/property/show/{id}', 'App\Http\Controllers\Properties@show')->name('property.show');
        
        Route::post('/aminities', 'App\Http\Controllers\Aminities@create')->name('aminities.create');
        Route::get('/aminities', 'App\Http\Controllers\Aminities@get')->name('aminities.get');
        Route::get('/aminities/delete', 'App\Http\Controllers\Aminities@delete')->name('aminities.delete');

        Route::post('/room/types', 'App\Http\Controllers\RoomTypes@create')->name('room.typescreate');
        Route::get('/room/types', 'App\Http\Controllers\RoomTypes@get')->name('room.typesget');
        Route::get('/room/types/delete', 'App\Http\Controllers\RoomTypes@delete')->name('room.types.delete');
        
        Route::post('/photo/upload', 'App\Http\Controllers\Photos@create')->name('photo.upload');
        Route::get('/photo/delete/{id}', 'App\Http\Controllers\Photos@delete')->name('photo.upload');
        
        Route::get('/booking/search', 'App\Http\Controllers\Bookings@listBookings')->name('booking.search');

        Route::get('/invoice/view', 'App\Http\Controllers\Invoice@get')->name('invoice.get');


        Route::get('/supplier/booking/list', 'App\Http\Controllers\Suppliers@get_booking_list')->name('supplier.booking.list');
        Route::get('/supplier/booking/show/{id}', 'App\Http\Controllers\Suppliers@show_booking')->name('supplier.booking.show');
        Route::post('/supplier/booking/confirm', 'App\Http\Controllers\Suppliers@confirm_booking')->name('supplier.booking.confirm');
        Route::post('/supplier/booking/cancel', 'App\Http\Controllers\Suppliers@cancel_booking')->name('supplier.booking.cancel');

        Route::get('/supplier/dashboard', 'App\Http\Controllers\Suppliers@dashboard')->name('supplier.dashboard');

        Route::get('/supplier/profile', 'App\Http\Controllers\Suppliers@show_profile')->name('supplier.profile.show');
        Route::post('/supplier/profile', 'App\Http\Controllers\Suppliers@update_profile')->name('supplier.profile.update');
        Route::post('/supplier/changepw', 'App\Http\Controllers\Suppliers@change_password')->name('supplier.changepw');        


    });
});
