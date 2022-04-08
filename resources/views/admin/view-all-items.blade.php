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
                        <table id="all_items_datatable" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Item Category</th>
                                    <th>Item Type</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($items as $item)
                                    <tr>
                                        <td>{{ $item->item_code }}</td>
                                        <td>{{ $item->item_category->cat_name }}</td>
                                        <td>{{ $item->item_type }}</td>
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
                                                <button type="submit" class="btn btn-danger btn-sm">
                                                    Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>    
                                @endforeach
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Item Category</th>
                                    <th>Item Type</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
