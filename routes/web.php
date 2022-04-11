<?php

use App\Http\Controllers\BranchController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DressSelectionController;
use App\Http\Controllers\InteringPaymentController;
use App\Http\Controllers\ItemCategoryController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\MeasurementController;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\SessionController;
use App\Models\Customer;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Auth::routes();

Route::middleware(['web', 'auth'])->group(function () {
    Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::resource('item_category', ItemCategoryController::class);
    Route::resource('item', ItemController::class);

    Route::resource('customer', CustomerController::class);
    Route::put('/measurment/date/{customer}/edit', [CustomerController::class ,'edit_measurment_date'])->name('edit_measurment_date');
    Route::put('/postpone/{customer}', [CustomerController::class, 'postpone'])->name('postpone');
    Route::put('/cancel/{customer}', [CustomerController::class, 'cancel'])->name('cancel');
    Route::put('/re_schedule/{customer}', [CustomerController::class, 're_schedule'])->name('re_schedule');

    Route::resource('note', NoteController::class);
    Route::put('/note/{note}/mark_as_read', [NoteController::class, 'mark_as_read'])->name('note.mark_as_read');

    Route::resource('select/dress', DressSelectionController::class);
    
    Route::post('set_tab0_session', [SessionController::class, 'set_tab0_session']);
    Route::post('set_tab1_session', [SessionController::class, 'set_tab1_session']);
    Route::post('set_tab2_session', [SessionController::class, 'set_tab2_session']);
    Route::post('set_tab3_session', [SessionController::class, 'set_tab3_session']);
    Route::post('set_tab4_session', [SessionController::class, 'set_tab4_session']);

    Route::get('autocomplete/groom/jacket', [ItemController::class, 'autocomplete_groom_jacket'])->name('autocomplete_groom_jacket');
    Route::get('autocomplete/groom/cavani', [ItemController::class, 'autocomplete_groom_cavani'])->name('autocomplete_groom_cavani');
    Route::get('autocomplete/bestman/jacket', [ItemController::class, 'autocomplete_bestman_jacket'])->name('autocomplete_bestman_jacket');
    Route::get('autocomplete/pageboy/jacket', [ItemController::class, 'autocomplete_pageboy_jacket'])->name('autocomplete_pageboy_jacket');
    Route::get('autocomplete/group/cavani', [ItemController::class, 'autocomplete_group_cavani'])->name('autocomplete_group_cavani');
    Route::get('autocomplete/function/place', [CustomerController::class, 'autocomplete_function_place'])->name('autocomplete_function_place');
    Route::get('autocomplete/bridal/dressing/place', [CustomerController::class, 'autocomplete_brida_place'])->name('autocomplete_brida_place');
    Route::get('autocomplete/photography/place', [CustomerController::class, 'autocomplete_photography_place'])->name('autocomplete_photography_place');
    
    Route::resource('intering_payment', InteringPaymentController::class);

    Route::post('measurement/store/update', [MeasurementController::class, 'store_measurements'])->name('measurement.store');
    Route::put('update_measurement/{measurement}', [MeasurementController::class, 'update_measurement'])->name('update_measurement');

    Route::post('/get_functions_of_day', [CustomerController::class, 'get_functions_of_day'])->name('get_functions_of_day');
    Route::post('/get_all_func_dates', [CustomerController::class, 'get_all_func_dates'])->name('get_all_func_dates');

    Route::resource('/branch', BranchController::class);
});
