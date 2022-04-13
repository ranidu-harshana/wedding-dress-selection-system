@extends('layouts.app_dataTable')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <div class="card-block">
                    <h6 class="card-title text-bold">All Customers</h6>
                    @if (session('bill-created'))
                        <div class="alert alert-success">
                            {{ session('bill-created') }}
                        </div>
                    @elseif(session('function-posponed'))
                        <div class="alert alert-success">
                            {{ session('function-posponed') }}
                        </div>
                    @elseif(session('measurment-date-updated'))
                        <div class="alert alert-success">
                            {{ session('measurment-date-updated') }}
                        </div>
                    @endif

                    <div class="table-responsive">
                        <table id="example" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Bill Number</th>
                                    <th>Branch</th>
                                    <th>Name</th>
                                    <th>Function Date</th>
                                    <th>Measurement Date</th>
                                    <th>Edit Measurement Date</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($customers as $customer)
                                    <tr>
                                        <td>{{ $customer->branch->prefix }}{{ $customer->bill_number }}</td>
                                        <td>{{ $customer->branch->name }}</td>
                                        <td>{{ $customer->name }}</td>
                                        <td>{{ $customer->function_date }}</td>
                                        <td>
                                            @if ($customer->measurement_date == NULL)
                                                <p class="text-danger font-weight-bold">Enter a Date</p> 
                                            @else
                                                {{ $customer->measurement_date }}
                                            @endif
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal{{ $customer->id }}">
                                                Edit
                                            </button>

                                            <div class="modal fade" id="exampleModal{{ $customer->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Edit Measurement Date</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="{{ route('edit_measurment_date', $customer->id) }}" method="post">
                                                                @csrf
                                                                @method('PUT')
                                                                <div class="form-group">
                                                                    <input class="form-control" type="date" name="measurement_date" value="{{ $customer->measurement_date }}" min="{{ date('Y-m-d') }}">
                                                                </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-success btn-sm" name="change_date">Change</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="{{ route('customer.show', $customer->id) }}"><button class="btn btn-primary btn-sm">View</button></a>
                                        </td>
                                    </tr>    
                                @endforeach
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Bill Number</th>
                                    <th>Branch</th>
                                    <th>Name</th>
                                    <th>Function Date</th>
                                    <th>Measurement Date</th>
                                    <th>Edit Measurement Date</th>
                                    <th>View</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
