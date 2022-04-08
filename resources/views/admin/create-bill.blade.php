@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-7">
            <div class="card-box">
                <h4 class="card-title">Schedule</h4>

                @if(session('failed'))
                    <div class="alert alert-danger">
                        {{ session('failed') }}
                    </div>
                @endif

                <form action="{{ route('customer.store') }}" method="POST">
                    @csrf
                    
                    <div class="form-group">
                        <label>Bill Number</label>
                        <input name="bill_number" value="{{ old('bill_number') }}" type="text" required class="form-control @error('bill_number') is-invalid @enderror">
                        @error('bill_number') <p class="text-danger">{{$message}}</p> @enderror
                    </div>

                    <div class="form-group">
                        <label>Branch</label>
                        <select name="branch_id" required class="form-control" value="{{ old('branch_id') }}">
                            @foreach ($branches as $branch)
                                <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" value="{{ old('name') }}" type="text" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <input name="address" value="{{ old('address') }}" type="text" required class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 1</label>
                        <input name="mobile_no1" value="{{ old('mobile_no1') }}" type="text" required class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 2</label>
                        <input name="mobile_no2" value="{{ old('mobile_no2') }}" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Function Date</label>
                        <input name="function_date" value="{{ old('function_date') }}" type="date" required class="form-control @error('function_date') is-invalid @enderror">
                        @error('function_date') <p class="text-danger">{{$message}}</p> @enderror
                    </div>

                    <div class="form-group">
                        <label>Function Place</label>
                        <input name="function_place" value="{{ old('function_place') }}" type="text" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Number of Bestmen</label>
                        <input name="no_of_bestmen" value="{{ old('no_of_bestmen') }}" type="number" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Number of Pageboys</label>
                        <input name="no_of_pageboys" value="{{ old('no_of_pageboys') }}" type="number" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Will you dress in our place?</label>
                        <select name="dressing_place" value="{{ old('dressing_place') }}" id="" required>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Do you change your dress during the function? </label>
                        <select name="" id="going_away_change_place" required onchange="visibleTextField()">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    {{-- if NO(0) this textfield must be visible --}}
                    <div class="form-group" style="display: none" id="going_away_textfield">
                        <label>Dress Changing Place</label>
                        <input name="going_away_change_place" value="{{ old('going_away_change_place') }}" type="text" class="form-control">
                    </div>
                    {{-- end --}}

                    <div class="form-group">
                        <label>Bridal Dressing Place </label>
                        <input name="bridal_dressing_place" value="{{ old('bridal_dressing_place') }}" id="bridal_dressing_place" type="text"  class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Bridal Color</label>
                        <input name="bridal_color" value="{{ old('bridal_color') }}" type="text" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Second Bride colors</label>
                        <input name="sec_bridal_group_color" value="{{ old('sec_bridal_group_color') }}" type="text" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Photography Place</label>
                        <input name="photography_place" value="{{ old('photography_place') }}" id="photography_place" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Total Amount</label>
                        <input name="total_amount" value="{{ old('total_amount') }}" type="number" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Discount</label>
                        <input name="discount" value="{{ old('discount') }}" type="number" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Advance Payment</label>
                        <input name="advance_payment" value="{{ old('advance_payment') }}" type="number" class="form-control">
                    </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        {{-- <div class="col-md-5">
            <img src="{{ asset('assets/img/SIL1263.jpg') }}" alt="" class="image-responsive" width="100%">
        </div> --}}
    </div>

    <script>
        var path = "{{ route('autocomplete_brida_place')  }}";
        $('#bridal_dressing_place').typeahead({
            
            source:  function (query, process) {
                return $.get(path, { term: query }, function (data) {
                    return process(data);
                });
            }
        });

        var path1 = "{{ route('autocomplete_photography_place')  }}";
        $('#photography_place').typeahead({
            
            source:  function (query1, process1) {
                return $.get(path1, { term1: query1 }, function (data1) {
                    return process1(data1);
                });
            }
        });
    </script>
@endsection