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
        $type = $request->type;
        $measurements = Measurement::where('customer_id', '=', $customer_id)->where('type', '=', $type)->get();
        if($measurements->isEmpty()) {
            $measurement = new Measurement($validated);
            if($customer->measurements()->save($measurement)) {
                return back();
            }
        }
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
