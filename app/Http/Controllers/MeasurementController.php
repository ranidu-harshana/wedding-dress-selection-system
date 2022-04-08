<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Measurement;
use Illuminate\Http\Request;

class MeasurementController extends Controller
{
    public function store_update_measurements(Request $request) {
        $validated = $request->validate([
            'type' => ['required'],
            'head' => ['required'],
            'shoulder' => ['required'],
            'chest' => ['required'],
            'weist' => ['required'],
            'tlength' => ['required'],
            'ssize' => ['required'],
            'arm' => ['required'],
            'jheight' => ['required'],
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
        }else{
            $measurements[0]->head = $request->head;
            $measurements[0]->shoulder = $request->shoulder;
            $measurements[0]->chest = $request->chest;
            $measurements[0]->weist = $request->weist;
            $measurements[0]->tlength = $request->tlength;
            $measurements[0]->ssize = $request->ssize;
            $measurements[0]->arm = $request->arm;
            $measurements[0]->jheight = $request->jheight;
            $measurements[0]->other = $request->other;
            $result = $customer->measurements()->save($measurements[0]);
                
            if($result) {
                return back();
            }
        }
    }
}
