@extends('layouts.app_dataTable')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <div class="card-block">
                    <h6 class="card-title text-bold">All Users</h6>
                    @if (session('user-created'))
                        <div class="alert alert-success">
                            {{ session('user-created') }}
                        </div>
                    @elseif(session('user-updated'))
                        <div class="alert alert-success">
                            {{ session('user-updated') }}
                        </div>
                    @endif

                    <div class="table-responsive">
                        <table id="all_users_table" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    @if ($user->id != auth()->user()->id)
                                        <tr>
                                            <td>{{ $user->id }}</td>
                                            <td>{{ $user->name }}</td>
                                            <td>{{ $user->email }}</td>
                                            <td>{{ $user->role->name }}</td>
                                            <td>
                                                <a href="{{ route('user.edit', $user->id) }}" class="btn btn-success btn-sm">Edit</a>
                                            </td>
                                        </tr>    
                                    @endif
                                    
                                @endforeach
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Edit</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
