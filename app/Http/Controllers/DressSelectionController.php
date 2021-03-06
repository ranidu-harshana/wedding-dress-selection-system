<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\DressSelection;
use App\Rules\checkInDatabase;
use App\Rules\checkItemAvailability;
use App\Rules\checkItemCodeDescSeperator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
            'groom_jacket'=> [new checkItemCodeDescSeperator, new checkInDatabase], // new checkItemAvailability($request->customer_id) 
            'groom_cavani'=> [new checkItemCodeDescSeperator, new checkInDatabase],
            'group_cavani'=> [new checkItemCodeDescSeperator, new checkInDatabase],
            'bestman_jacket.*'=>[new checkItemCodeDescSeperator, new checkInDatabase],
            'pageboy_jacket.*'=>[new checkItemCodeDescSeperator, new checkInDatabase],
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
        
        array_push($data, ['type'=> 'Group Cavani', 'name'=>$request->group_cavani]);
        $customer = Customer::find($request->customer_id);
        session()->flash('dress-saved', 'Dress Selected');
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
        $customer_id = $request->customer_id;
        $request->validate([
            'dress' => ['required', 'unique:dress_selections,name,NULL,id,customer_id,' . $customer_id, new checkItemCodeDescSeperator, new checkInDatabase], // new checkItemAvailability($customer_id)
        ]);

        $dress = DressSelection::find($id);
        $dress->update([
            'name'=>$request->dress,
        ]);

        session()->flash('dress-updated', 'Dress Selection Updated');
        return back();
    }

    public function show_all_reserved_items() {
        return view('view-all-reserved-items');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dress = DressSelection::find($id);
        $type = $dress->type;
        if($type[0] == 'B') {
            DB::table('customers')->where('id', '=', $dress->customer_id)->decrement('no_of_bestmen');
        }else{
            DB::table('customers')->where('id', '=', $dress->customer_id)->decrement('no_of_pageboys');
        }
        
        session()->flash('dress-deleted', 'Dress Selection Deleted');
        $dress->delete($dress);
        return back();
    }
}
