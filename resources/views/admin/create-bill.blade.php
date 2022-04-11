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
                        <input name="bill_number" value="{{ old('bill_number') }}" type="text" required class="form-control @error('bill_number') is-invalid @enderror" autocomplete="off">
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
                        <input name="name" value="{{ old('name') }}" type="text" required class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <input name="address" value="{{ old('address') }}" type="text" required class="form-control" autocomplete="off">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 1</label>
                        <input name="mobile_no1" value="{{ old('mobile_no1') }}" type="text" required class="form-control" autocomplete="off">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 2</label>
                        <input name="mobile_no2" value="{{ old('mobile_no2') }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Function Date</label>
                        <input name="function_date" value="{{ old('function_date') }}" type="date" required class="form-control @error('function_date') is-invalid @enderror" autocomplete="off">
                        @error('function_date') <p class="text-danger">{{$message}}</p> @enderror
                    </div>

                    <div class="form-group">
                        <label>Function Place</label>
                        <input name="function_place" id="function_place" value="{{ old('function_place') }}" type="text" required class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Number of Bestmen</label>
                        <select name="no_of_bestmen" id="" required class="form-control">
                            <option value="0">Select</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Number of Pageboys</label>
                        <select name="no_of_pageboys" id="" required class="form-control">
                            <option value="0">Select</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Will you dress in our place?</label>
                        <select name="dressing_place" value="{{ old('dressing_place') }}" id="" required class="form-control">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Going away Change? </label>
                        <select name="" id="going_away_change_place" required onchange="visibleTextField()">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    {{-- if NO(0) this textfield must be visible --}}
                    <div class="form-group" style="display: none" id="going_away_textfield">
                        <label>Dress Changing Place</label>
                        <input name="going_away_change_place" value="{{ old('going_away_change_place') }}" type="text" class="form-control" autocomplete="off">
                    </div>
                    {{-- end --}}

                    <div class="form-group">
                        <label>Bridal Saloon </label>
                        <input name="bridal_dressing_place" value="{{ old('bridal_dressing_place') }}" id="bridal_dressing_place" type="text"  class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Bridal Color (Saree)</label>
                        <input name="bridal_color" value="{{ old('bridal_color') }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Bride Mates color</label>
                        <input name="sec_bridal_group_color" value="{{ old('sec_bridal_group_color') }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Photographer/Studio</label>
                        <input name="photography_place" value="{{ old('photography_place') }}" id="photography_place" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Total Amount</label>
                        <input name="total_amount" id="total_amount" value="{{ old('total_amount') }}" type="number" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Discount</label>
                        <input name="discount" id="discount" value="{{ old('discount') }}" type="number" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Advance Payment</label>
                        <input name="advance_payment" id="advance_payment" value="{{ old('advance_payment') }}" type="number" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Balance to be paid</label>
                        <input name="balance_to_be_paid" id="balance_to_be_paid" type="number" class="form-control" disabled>
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
        var path0 = "{{ route('autocomplete_function_place')  }}";
        $('#function_place').typeahead({
            
            source:  function (query0, process0) {
                return $.get(path0, { term0: query0 }, function (data0) {
                    return process0(data0);
                });
            }
        });

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

        $('#total_amount').keyup(function(){
            var total_amount = $('#total_amount').val()
            var discount = $('#discount').val()
            var advance_payment = $('#advance_payment').val()
            
            var balance_to_be_paid = Number(total_amount)-(Number(discount)+Number(advance_payment));
            $('#balance_to_be_paid').val(balance_to_be_paid);
        });

        $('#discount').keyup(function(){
            var total_amount = $('#total_amount').val()
            var discount = $('#discount').val()
            var advance_payment = $('#advance_payment').val()
            
            var balance_to_be_paid = Number(total_amount)-(Number(discount)+Number(advance_payment));
            $('#balance_to_be_paid').val(balance_to_be_paid);
        });

        $('#advance_payment').keyup(function(){
            var total_amount = $('#total_amount').val()
            var discount = $('#discount').val()
            var advance_payment = $('#advance_payment').val()

            var balance_to_be_paid = Number(total_amount)-(Number(discount)+Number(advance_payment));
            $('#balance_to_be_paid').val(balance_to_be_paid);
        });
    </script>
@endsection