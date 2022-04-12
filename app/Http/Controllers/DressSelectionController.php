<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\DressSelection;
use Illuminate\Http\Request;

class DressSelectionController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'=>'required'
        ]);
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
        
        if ($request->group_cavani != NULL) {
            $arr['type'] = "Group Cavani";
            $arr['name'] = $request->group_cavani;
            array_push($data, $arr);
        }
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
        $validated = $request->validate([
            'dress' => 'required',
        ]);

        $dress = DressSelection::find($id);
        $dress->update([
            'name'=>$request->dress,
        ]);
        return back();
    }

    
}
