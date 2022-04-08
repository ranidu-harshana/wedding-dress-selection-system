<?php

namespace App\Http\Controllers;

use App\Models\ItemCategory;
use Illuminate\Http\Request;

class ItemCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('is_admin');
    }
    
    public function index()
    {
        $categories = ItemCategory::all();
        return view('admin.create-item-category', compact('categories'));
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
            'cat_name' => 'required',
        ]);

        ItemCategory::create($validated);
        
        session()->flash('item-category-created', 'New Item Category Created');
        return redirect()->route('item_category.index');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = ItemCategory::find($id);
        $categories = ItemCategory::all();
        return view('admin.create-item-category', ['category'=>$category, 'categories'=>$categories]);
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
            'cat_name' => 'required',
        ]);

        $category = ItemCategory::find($id);
        $category->update([
            'cat_name' => $validated['cat_name'],
        ]);

        session()->flash('item-category-updated', 'Item Category Updated');
        return redirect()->route('item_category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = ItemCategory::find($id);
        if($category->delete()) {
            session()->flash('item-category-deleted', 'Item Category Deleted');
        }
        return redirect()->route('item_category.index');
    }
}
