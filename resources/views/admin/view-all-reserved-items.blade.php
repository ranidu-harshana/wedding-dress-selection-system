@extends('layouts.app_dataTable')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <div class="card-block">
                    <h6 class="card-title text-bold">All Reserved Items</h6>
                    
                    <div class="table-responsive">
                        <table id="all_reserved_items_datatable" class="table table-striped table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th>Reserved Date</th>
                                    <th>Item</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($dresses as $dress)
                                    <tr>
                                        <td>{{ $dress->customer->function_date }}</td>
                                        <td>{{ $dress->name }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Reserved Date</th>
                                    <th>Item</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
