<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Measurement;
use Illuminate\Http\Request;

class MeasurementController extends Controller
{
    public function store_measurements(Request $request) {
        $validated = $request->validate([
            'type' => ['nullable'],
            'head' => ['nullable'],
            'shoulder' => ['nullable'],
            'chest' => ['nullable'],
            'weist' => ['nullable'],
            'tlength' => ['nullable'],
            'ssize' => ['nullable'],
            'arm' => ['nullable'],
            'jheight' => ['nullable'],
            'other' => ['nullable'],
        ]);

        $customer_id = $request->customer_id;
        $customer = Customer::find($customer_id);
        $customer->measurements()->create($validated);
        return back();
    }

    public function update_measurement(Request $request, $id) {
        $validated = $request->validate([
            'head' => ['nullable'],
            'shoulder' => ['nullable'],
            'chest' => ['nullable'],
            'weist' => ['nullable'],
            'tlength' => ['nullable'],
            'ssize' => ['nullable'],
            'arm' => ['nullable'],
            'jheight' => ['nullable'],
            'other' => ['nullable'],
        ]);

        $measurement = Measurement::find($id);
        $measurement->update($validated);
        return back();
    }
}
