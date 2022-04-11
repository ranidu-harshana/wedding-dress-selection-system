@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Create Branch</h4>
                @if (session('branch-created'))
                    <div class="alert alert-success">
                        {{ session('branch-created') }}
                    </div>
                @elseif(session('branch-updated'))
                    <div class="alert alert-success">
                        {{ session('branch-updated') }}
                    </div>
                @elseif(session('branch-deleted'))
                    <div class="alert alert-danger">
                        {{ session('branch-deleted') }}
                    </div>
                @endif

                @if (isset($branch))
                    <form action="{{ route('branch.update', $branch->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label>Branch Name</label>
                            <input type="text" name="name" class="form-control" value="{{ $branch->name }}" autocomplete="off">
                        </div>

                        <div class="form-group">
                            <label>Prefix</label>
                            <input type="text" name="prefix" class="form-control" value="{{ $branch->prefix }}" autocomplete="off">
                        </div>

                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                @else
                    <form action="{{ route('branch.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label>Branch Name</label>
                            <input type="text" name="name" class="form-control @error('name') is-invalid @enderror">
                            @error('name') <p class="text-danger">{{$message}}</p> @enderror
                        </div>

                        <div class="form-group">
                            <label>Prefix</label>
                            <input type="text" name="prefix" class="form-control @error('prefix') is-invalid @enderror">
                            @error('prefix') <p class="text-danger">{{$message}}</p> @enderror
                        </div>
                    
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                @endif
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card-box">
                <div class="card-block">
                    <h5 class="text-bold card-title">Striped Rows</h5>
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($branches as $branch)
                                    <tr>
                                        <td>{{ $branch->id }}</td>
                                        <td>{{ $branch->name }}</td>
                                        <td>{{ $branch->prefix }}</td>
                                        <td>
                                            <a href="{{ route('branch.edit', $branch->id) }}">
                                                <button class="btn btn-primary btn-sm">Edit</button>
                                            </a>
                                        </td>
                                        <td>
                                            <form action="{{ route('branch.destroy', $branch->id) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </td>
                                    </tr>    
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection