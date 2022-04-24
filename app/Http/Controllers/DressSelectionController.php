<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\DressSelection;
use App\Rules\checkInDatabase;
use App\Rules\checkItemCodeDescSeperator;
use Illuminate\Http\Request;

class DressSelectionController extends Controller
{
    public function index() {
        $dresses = DressSelection::all();
        return view('admin.view-all-reserved-items', ['dresses'=>$dresses]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bestman_count = 0;
        $pageboy_count = 0;
        $request->validate([
            'groom_jacket'=> [new checkItemCodeDescSeperator, new checkInDatabase],
            'groom_cavani'=> [new checkItemCodeDescSeperator, new checkInDatabase],
            'group_cavani'=> [new checkItemCodeDescSeperator, new checkInDatabase],
        ]);


        try {
            $bestman_count = count($request->bestman_jacket);
            for ($i=0; $i < $bestman_count; $i++) { 
                $request->validate([
                    'bestman_jacket.'.$i=> [new checkItemCodeDescSeperator, new checkInDatabase]
                ]);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        try {
            $pageboy_count = count($request->pageboy_jacket);
        for ($i=0; $i < $pageboy_count; $i++) { 
            $request->validate([
                'pageboy_jacket.'.$i=> [new checkItemCodeDescSeperator, new checkInDatabase]
            ]);
        }
        } catch (\Throwable $th) {
            //throw $th;
        }
        
        
        $data = [
            ['type'=> 'Groom\'s Jacket', 'name'=>$request->groom_jacket],
            ['type'=> 'Groom\'s Cavani', 'name'=>$request->groom_cavani],
            
        ];
        
        $arr = [];
        $i = 0;

        if ($request->bestman_jacket != NULL) {
            foreach ($request->bestman_jacket as $jacket) {
                $arr['type'] = "Bestman's Jacket - ".$i+1;
                $arr['name'] = $jacket;
                array_push($data, $arr);
                $arr = [];
                $i++;
            }
        }

        $i = 0;
        if ($request->pageboy_jacket != NULL) {
            foreach ($request->pageboy_jacket as $jacket) {
                $arr['type'] = "Pageboy's Jacket - ".$i+1;
                $arr['name'] = $jacket;
                array_push($data, $arr);
                $arr = [];
                $i++;
            }
        }
        
        array_push($data, ['type'=> 'Group Cavani', 'name'=>$request->group_cavani]);
        $customer = Customer::find($request->customer_id);
        if($customer->dress_selections()->createMany($data)) {
            return back();
        }
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
        $request->validate([
            'dress' => ['required', new checkItemCodeDescSeperator, new checkInDatabase],
        ]);

        $dress = DressSelection::find($id);
        $dress->update([
            'name'=>$request->dress,
        ]);
        return back();
    }

    public function show_all_reserved_items() {
        return view('view-all-reserved-items');
    }
}
