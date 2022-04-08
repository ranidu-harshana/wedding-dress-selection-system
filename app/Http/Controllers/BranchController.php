<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use Illuminate\Http\Request;

class BranchController extends Controller
{
    public function __construct()
    {
        $this->middleware('is_admin');
    }

    public function index()
    {
        $branches = Branch::all();
        return view('admin.create-branch', compact('branches'));
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
            'name' => 'required',
            'prefix' => 'required',
        ]);

        Branch::create($validated);
        
        session()->flash('branch-created', 'New Branch Created');
        return redirect()->route('branch.index');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $branch = Branch::find($id);
        $branches = Branch::all();
        return view('admin.create-branch', ['branch'=>$branch, 'branches'=>$branches]);
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

        $category = Branch::find($id);
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
        $category = Branch::find($id);
        if($category->delete()) {
            session()->flash('item-category-deleted', 'Item Category Deleted');
        }
        return redirect()->route('item_category.index');
    }
}
