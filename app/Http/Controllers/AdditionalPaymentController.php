<?php

namespace App\Http\Controllers;

use App\Models\AdditionalPayment;
use App\Models\Customer;
use Illuminate\Http\Request;

class AdditionalPaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'additional_payment' => 'required',
            'reason' => 'required',
        ]);

        $customer_id = $request->customer_id;

        $customer = Customer::find($customer_id);
        $total_amount = $customer->total_amount + $request->additional_payment;
        $result = $customer->additional_payments()->create($validated);

        $customer->update([
            'total_amount'=>$total_amount,
        ]);
        if ($result) {
            session()->flash('additional-payment-saved', 'Additional Payment Saved');
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // $validated = $request->validate([
        //     'additional_payment' => 'required',
        //     'reason' => 'required',
        // ]);
        // $additional_payment = AdditionalPayment::find($id);
        // $additional_payment->update($validated);
        // return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $additional_payment= AdditionalPayment::find($id);
        $total_amount = $additional_payment->customer->total_amount - $additional_payment->additional_payment;
        $additional_payment->customer()->update([
            'total_amount'=>$total_amount,
        ]);

        $additional_payment->delete();
        return back();
    }
}
