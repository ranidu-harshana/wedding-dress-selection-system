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
                        <table id="all_users_table" class="table table-striped table-bordered table-sm" style="width:100%">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Action</th>
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
                                                <div class="btn-group btn-group-sm" role="group" data-toggle="tooltip" data-trigger="hover" data-placement="top" title="Attach Branches">
                                                    <form action="{{ route('user.brach.attach', $user->id) }}" method="post">
                                                        @csrf
                                                        <button type="button" class="btn" style="background-color: #4285F4; color: white" onclick="openModal({{$user->id}})">
                                                            <i class="fas fa-link"></i>
                                                        </button>
                                                        
                                                        <div class="modal fade" id="attachBranchesModal{{ $user->id }}" tabindex="-1" role="dialog" aria-labelledby="attachBranchesModal{{ $user->id }}Label" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="attachBranchesModal{{ $user->id }}Label">Attach Branches - <span class="badge badge-success">{{ $user->name }}</span></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" id="attachBranchesModalBody{{ $user->id }}">
                                                                        
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-success">Done</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="btn-group btn-group-sm" role="group" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" title="Dettach Branches">
                                                    <form action="{{ route('user.brach.detach', $user->id) }}" method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#detachBranchesModal{{ $user->id }}">
                                                            <i class="fas fa-unlink"></i>
                                                        </button>
                                                        <div class="modal fade" id="detachBranchesModal{{ $user->id }}" tabindex="-1" role="dialog" aria-labelledby="detachBranchesModal{{ $user->id }}Label" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="detachBranchesModal{{ $user->id }}Label">Detach Branches - <span class="badge badge-success">{{ $user->name }}</span></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        @if ($user->branches->count() != 0)
                                                                            @foreach ($user->branches as $branch)
                                                                                <input type="checkbox" id="detach_branches{{ $user->id }}{{ $branch->id }}" name="detach_branches[]" value="{{ $branch->id }}"> <label for="detach_branches{{ $user->id }}{{ $branch->id }}">{{ $branch->name }}</label> <br>
                                                                            @endforeach
                                                                        @else
                                                                            <div class="alert alert-success" role="alert">No any Branches to Detach</div>
                                                                        @endif
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-danger">Done</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="btn-group btn-group-sm" role="group" data-toggle="tooltip" data-trigger="hover" data-placement="top" title="Change Password">
                                                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#changePasswordModal">
                                                        <i class="fas fa-key"></i>
                                                    </button>
                                                    <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="changePasswordModalLabel">Edit Password - <span class="badge badge-success">{{ $user->name }}</span></h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    ...
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="{{ route('user.edit', $user->id) }}" class="btn btn-primary btn-sm">Edit</a>
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
                                    <th>Action</th>
                                    <th>Edit</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openModal(user_id) {
            $('#attachBranchesModal'+user_id).modal('show');
            

            $.ajax({
				url: "../user/branches/"+user_id,
				type: "GET",
				success: function(data){
                    html = '';
                    if (data.length != 0) {
                        data.forEach(element => {
                            html += '<input type="checkbox" id="attach_branches'+user_id+''+element.id+'" name="attach_branches[]" value="'+element.id+'"> <label for="attach_branches'+user_id+''+element.id+'">'+element.name+'</label> <br>';
                        });
                    }else{
                        html = '<div class="alert alert-success" role="alert">No any Branches to Attach</div>';
                    }
					
                    $("#attachBranchesModalBody"+user_id).html(html);
				}
			})
        }
    </script>
    
@endsection