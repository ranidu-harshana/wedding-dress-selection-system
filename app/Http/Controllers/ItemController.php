<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\ItemCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ItemController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('is_admin')->except('index');
    // }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = Item::all();
        return view('admin.view-all-items', ['items'=>$items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = ItemCategory::all();
        return view('admin.create-item', ['categories'=>$categories]);
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
            'item_category_id' => ['required'],
            'item_code' => ['required', 'unique:items,item_code'],
            'item_desc' => ['required'],
            'item_type' => ['required'],
            'item_image_url' => ['nullable'],
        ]);

        if ($request->hasFile('item_image_url')) {
            $request->item_image_url->store('item', 'public');

            $category_id = $validated['item_category_id'];
            $category = ItemCategory::find($category_id);

            $comment = $category->items()->create([
                'item_code' => $validated['item_code'],
                'item_desc' => $validated['item_desc'],
                'item_type' => $validated['item_type'],
                "item_image_url" => $request->item_image_url->hashName()
            ]);

            if($comment) {
                session()->flash('item-created', 'New Item Created');
            }else{
                session()->flash('failed', 'Failed');
            }
            
            return redirect()->route('item.index');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($item)
    {
        $exploded = explode(' - ', $item);
        $item = Item::where('item_code', '=', $exploded[0])->orWhere('item_desc', '=', $exploded[1])->get();
        return response()->json(['image'=>$item[0]->item_image_url]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Item::find($id);
        $categories = ItemCategory::all();
        return view('admin.edit-item', ['item'=>$item, 'categories'=>$categories]);
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
            'item_category_id' => ['required'],
            'item_code' => ['required'],
            'item_desc' => ['required'],
            'item_type' => ['required'],
        ]);
        
        if ($request->hasFile('item_image_url')) {
            $request->item_image_url->store('item', 'public');

            $item = Item::find($id);
            $result = $item->update([
                'item_category_id' => $validated['item_category_id'],
                'item_code' => $validated['item_code'],
                'item_desc' => $validated['item_desc'],
                'item_type' => $validated['item_type'],
                "item_image_url" => $request->item_image_url->hashName()
            ]);
        }else{
            $item = Item::find($id);
            $result = $item->update([
                'item_category_id' => $validated['item_category_id'],
                'item_code' => $validated['item_code'],
                'item_desc' => $validated['item_desc'],
                'item_type' => $validated['item_type'],
            ]);
        }
        if($result) {
            session()->flash('item-updated', 'Item Updated');
        }else{
            session()->flash('failed', 'Failed');
        }
        
        return redirect()->route('item.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Item::find($id);

        $exist_image = $item->item_image_url;
        
        if($item->delete()) {
            if(File::exists(public_path('storage/item/'.$exist_image))) {
                File::delete(public_path('storage/item/'.$exist_image));
                session()->flash('item-deleted', 'Item Deleted');
            }
        }
        return redirect()->back();
    }


    public function autocomplete_groom_jacket(Request $request)
    {
        $data = Item::select('item_desc', 'item_code')
                    ->where(function ($query) use($request) { $query->where('item_code','LIKE',"%{$request->term}%")
                    ->orWhere('item_desc','LIKE',"%{$request->term}%");})
                    ->where('item_type','=','Groom')
                    ->where('item_category_id','=',1)
                    ->pluck('item_desc', 'item_code');

        // $keys = array_keys($data->toArray());
        // $values = array_values($data->toArray());
        // $full_arr = array_merge($keys, $values);

        $full_arr = [];
        foreach ($data->toArray() as $key => $value) {
            array_push($full_arr, $key.' - '.$value);
        }

        return response()->json($full_arr);
    }

    public function autocomplete_groom_cavani(Request $request)
    {
        $data = Item::select('item_desc', 'item_code')
                    ->where(function ($query) use($request) { $query->where('item_code','LIKE',"%{$request->term1}%")
                    ->orWhere('item_desc','LIKE',"%{$request->term1}%");})
                    ->where('item_category_id','=',2)
                    ->where('item_type','=','Groom')
                    ->pluck('item_desc', 'item_code');

        // $keys = array_keys($data->toArray());
        // $values = array_values($data->toArray());

        // $full_arr = array_merge($keys, $values);
        $full_arr = [];
        foreach ($data->toArray() as $key => $value) {
            array_push($full_arr, $key.' - '.$value);
        }
        return response()->json($full_arr);
    }

    public function autocomplete_bestman_jacket(Request $request)
    {
        $data = Item::select('item_desc', 'item_code')
                    ->where(function ($query) use($request) { $query->where('item_code','LIKE',"%{$request->term2}%")
                    ->orWhere('item_desc','LIKE',"%{$request->term2}%");})
                    ->where('item_category_id','=',1)
                    ->where('item_type','=','Bestman')
                    ->pluck('item_desc', 'item_code');

        // $keys = array_keys($data->toArray());
        // $values = array_values($data->toArray());

        // $full_arr = array_merge($keys, $values);
        $full_arr = [];
        foreach ($data->toArray() as $key => $value) {
            array_push($full_arr, $key.' - '.$value);
        }
        return response()->json($full_arr);
    }

    public function autocomplete_pageboy_jacket(Request $request)
    {
        $data = Item::select('item_desc', 'item_code')
                    ->where(function ($query) use($request) { $query->where('item_code','LIKE',"%{$request->term3}%")
                    ->orWhere('item_desc','LIKE',"%{$request->term3}%");})
                    ->where('item_category_id','=',1)
                    ->where('item_type','=','Pageboy')
                    ->pluck('item_desc', 'item_code');

        // $keys = array_keys($data->toArray());
        // $values = array_values($data->toArray());

        // $full_arr = array_merge($keys, $values);
        $full_arr = [];
        foreach ($data->toArray() as $key => $value) {
            array_push($full_arr, $key.' - '.$value);
        }
        return response()->json($full_arr);
    }

    public function autocomplete_group_cavani(Request $request)
    {
        $data = Item::select('item_desc', 'item_code')
                    ->where(function ($query) use($request) { $query->where('item_code','LIKE',"%{$request->term4}%")
                    ->orWhere('item_desc','LIKE',"%{$request->term4}%");})
                    ->where('item_category_id','=',2)
                    ->where('item_type','!=','Groom')
                    ->pluck('item_desc', 'item_code');
        // $keys = array_keys($data->toArray());
        // $values = array_values($data->toArray());

        // $full_arr = array_merge($keys, $values);
        $full_arr = [];
        foreach ($data->toArray() as $key => $value) {
            array_push($full_arr, $key.' - '.$value);
        }
        return response()->json($full_arr);
    }
}
