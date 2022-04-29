<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Customer;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();
        return view('admin.all-users', ['users'=>$users]);
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
        //
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
        $user = User::find($id);
        $roles = Role::all();
        return view('admin.edit-user', ['user'=>$user, 'roles'=>$roles]);
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
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.$id],
            'user_role' => ['required'],
        ]);

        $user = User::find($id);
        $user->update([
            'name'=>$request->name,
            'email'=>$request->email,
            'role_id'=>$request->user_role
        ]);
        return redirect()->route('user.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function get_user_branches($id) {
        $customer = User::find($id);
        $ids = [];
        foreach($customer->branches as $branch){
            array_push($ids, $branch->id);
        }
        $branches = Branch::whereNotIn('id', $ids)->get();

        return response()->json($branches);
    }

    public function branch_attach(Request $request, $id) {
        $request->validate([
            'attach_branches'=>'required',
        ]);
        $user = User::find($id);
        $user->branches()->attach($request->attach_branches);
        return back();
    }

    public function branch_detach(Request $request, $id) {
        $request->validate([
            'detach_branches'=>'required',
        ]);
        $user = User::find($id);
        $user->branches()->detach($request->detach_branches);
        return back();
    }
}
