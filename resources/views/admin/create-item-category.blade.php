@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Create Item Category</h4>
                @if (session('item-category-created'))
                    <div class="alert alert-success">
                        {{ session('item-category-created') }}
                    </div>
                @elseif(session('item-category-updated'))
                    <div class="alert alert-success">
                        {{ session('item-category-updated') }}
                    </div>
                @elseif(session('item-category-deleted'))
                    <div class="alert alert-danger">
                        {{ session('item-category-deleted') }}
                    </div>
                @endif

                @if (isset($category))
                    <form action="{{ route('item_category.update', $category->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label>Category Name</label>
                            <input type="text" name="cat_name" class="form-control" value="{{ $category->cat_name }}">
                            <span class="text-danger small">*Do not change sequence of Item Categories when editing</span>
                        </div>
                    
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                @else
                    <form action="{{ route('item_category.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label>Category Name</label>
                            <input type="text" name="cat_name" class="form-control">
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
                                    {{-- <th>Delete</th> --}}
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($categories as $category)
                                    <tr>
                                        <td>{{ $category->id }}</td>
                                        <td>{{ $category->cat_name }}</td>
                                        <td>
                                            <a href="{{ route('item_category.edit', $category->id) }}">
                                                <button class="btn btn-primary btn-sm">Edit</button>
                                            </a>
                                        </td>
                                        {{-- <td>
                                            <form action="{{ route('item_category.destroy', $category->id) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </td> --}}
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