@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-7">
            <div class="card-box">
                <div class="row">
                    <div class="col-2">
                        <h4 class="card-title">Edit Bill</h4>
                    </div>
                    <div class="col-10 text-right">
                        <a href="{{ url()->previous() }}" class="btn btn-danger">Go Back</a>
                    </div>
                </div>

                @if(session('failed'))
                    <div class="alert alert-danger">
                        {{ session('failed') }}
                    </div>
                @endif
                <br>
                <form action="{{ route('customer.update', $customer->id ) }}" method="POST">
                    @csrf
                    @method('PUT')
                    
                    <div class="form-group">
                        <label>Bill Number</label>
                        <input name="bill_number" disabled value="{{ $customer->bill_number }}" type="text" required class="form-control @error('bill_number') is-invalid @enderror" autocomplete="off" >
                        @error('bill_number') <p class="text-danger">{{$message}}</p> @enderror
                    </div>

                    <div class="form-group">
                        <label>Branch</label>
                        <select name="branch_id" required class="form-control" value="{{ $customer->branch_id }}">
                            <option value="{{ $customer->branch->id }}">{{ $customer->branch->name }}</option>
                            @foreach ($branches as $branch)
                                @if ($customer->branch->name != $branch->name )
                                    <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" value="{{ $customer->name }}" type="text" required class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <input name="address" value="{{ $customer->address }}" type="text" required class="form-control" autocomplete="off">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 1</label>
                        <input name="mobile_no1" value="{{ $customer->mobile_no1 }}" type="text" required class="form-control" autocomplete="off">
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No. 2</label>
                        <input name="mobile_no2" value="{{ $customer->mobile_no2 }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Function Place</label>
                        <input name="function_place" value="{{ $customer->function_place }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Number of Bestmen</label>
                        <select name="no_of_bestmen" id="" required class="form-control">
                            @if ($customer->dress_selections->count() != 0)
                                @if ($customer->no_of_bestmen == NULL)
                                    <option value="0">Select</option>
                                @endif
                                @for ($i = $customer->no_of_bestmen; $i < 9; $i++)
                                    <option value="{{ $i }}">{{ $i }}</option>
                                @endfor
                            @else
                                @if ($customer->no_of_bestmen != NULL)
                                    <option value="{{ $customer->no_of_bestmen }}">{{ $customer->no_of_bestmen }}</option>
                                @endif
                                
                                @for ($i = 1; $i < 9; $i++)
                                    @if ($customer->no_of_bestmen != $i)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endif
                                @endfor
                            @endif
                            
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Number of Pageboys</label>
                        <select name="no_of_pageboys" id="" required class="form-control">
                            @if ($customer->dress_selections->count() != 0)
                                @if ($customer->no_of_pageboys == NULL)
                                    <option value="0">Select</option>
                                @endif
                                @for ($i = $customer->no_of_pageboys; $i < 9; $i++)
                                    <option value="{{ $i }}">{{ $i }}</option>
                                @endfor
                            @else
                                @if ($customer->no_of_pageboys != NULL)
                                    <option value="{{ $customer->no_of_pageboys }}">{{ $customer->no_of_pageboys }}</option>
                                @endif
                                
                                @for ($i = 1; $i < 9; $i++)
                                    @if ($customer->no_of_pageboys != $i)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endif
                                @endfor
                            @endif
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Will you dress in our place?</label>
                        <select name="dressing_place" value="{{ $customer->dressing_place }}" id="" required class="form-control">
                            @if ($customer->dressing_place == 1)
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            @else
                                <option value="0">No</option>
                                <option value="1">Yes</option>
                            @endif
                        </select>
                    </div>

                    @if ($customer->going_away_change_place == NULL)
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
                    @else
                        <div class="form-group">
                            <label>Dress Changing Place (Going Away - NO)</label>
                            <input name="going_away_change_place" value="{{ $customer->going_away_change_place }}" type="text" class="form-control" autocomplete="off">
                        </div>
                    @endif
                    
                    <div class="form-group">
                        <label>Bridal Saloon </label>
                        <input name="bridal_dressing_place" value="{{ $customer->bridal_dressing_place }}" id="bridal_dressing_place" type="text"  class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Bridal Color (Saree)</label>
                        <input name="bridal_color" value="{{ $customer->bridal_color }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Bride Mates color</label>
                        <input name="sec_bridal_group_color" value="{{ $customer->sec_bridal_group_color }}" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label>Photographer Studio</label>
                        <input name="photography_place" value="{{ $customer->photography_place }}" id="photography_place" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        {{-- <div class="col-md-5">
            <img src="{{ asset('assets/img/SIL1263.jpg }}" alt="" class="image-responsive" width="100%">
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