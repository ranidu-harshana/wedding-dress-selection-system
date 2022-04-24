@extends('layouts.app_dataTable')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <div class="card-block">
                    <h6 class="card-title text-bold">Inventory</h6>
                    @if (session('item-created'))
                        <div class="alert alert-success">
                            {{ session('item-created') }}
                        </div>
                    @elseif(session('item-updated'))
                        <div class="alert alert-success">
                            {{ session('item-updated') }}
                        </div>
                    @elseif(session('item-deleted'))
                        <div class="alert alert-danger">
                            {{ session('item-deleted') }}
                        </div>
                    @endif
                    
                    <div class="table-responsive">
                        <table id="all_items_datatable" class="table table-striped table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Item Description</th>
                                    <th>Item Category</th>
                                    <th>Item Type</th>
                                    @if (auth()->check())
                                        @if (auth()->user()->is_admin())
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        @endif
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($items as $item)
                                    <tr>
                                        <td>{{ $item->item_code }}</td>
                                        <td>{{ $item->item_desc }}</td>
                                        <td>{{ $item->item_category->cat_name }}</td>
                                        <td>{{ $item->item_type }}</td>
                                        @if (auth()->check())
                                            @if (auth()->user()->is_admin())
                                            <td>
                                                <a href="{{ route('item.edit', $item->id) }}">
                                                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal">
                                                        Edit
                                                    </button>
                                                </a>
                                            </td>
                                            
                                            <td>
                                                <form action="{{ route('item.destroy', $item->id) }}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteItemModal">
                                                        Delete
                                                    </button>
                                                    <div class="modal fade" id="deleteItemModal" tabindex="-1" role="dialog" aria-labelledby="deleteItemModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="deleteItemModalLabel">Warning</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Are you sure you want to delete this item?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                            @endif
                                        @endif
                                    </tr>    
                                @endforeach
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Item Description</th>
                                    <th>Item Category</th>
                                    <th>Item Type</th>
                                    @if (auth()->check())
                                        @if (auth()->user()->is_admin())
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        @endif
                                    @endif
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
