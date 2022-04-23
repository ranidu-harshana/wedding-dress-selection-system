@extends('layouts.app')

@section('content')
@if($errors->any())
    {!! implode('', $errors->all('<div>:message</div>')) !!}
@endif
    <div class="row">
        <div class="col-sm-7 col-6">
            <h4 class="page-title">Customer Profile</h4>
        </div>
    
        <div class="col-sm-5 col-6 text-right m-b-30 ">
            @if ($customer->status == 1)
                
                <form action="{{ route('cancel', $customer->id) }}" method="post">
                    @csrf
                    @method('PUT')
                    <button type="button" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#cancelWedding"><i class="fas fa-ban"></i> 
                        Cancel
                    </button>
    
                    <div class="modal fade" id="cancelWedding" tabindex="-1" role="dialog" aria-labelledby="cancelWeddingLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="cancelWeddingLabel">Warning</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want cancel this wedding?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button class="btn btn-danger" type="submit">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="{{ route('customer.edit', $customer->id) }}" class="btn btn-success btn-rounded"><i class="fas fa-edit"></i> Edit</a>
                    <a href="" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#postponedDateModal"><i class="fa fa-plus"></i> Postpone</a>
                </form>
            @else
                <form action="{{ route('re_schedule', $customer->id) }}" method="post">
                    @csrf
                    @method('PUT')
                    <button type="button" class="btn btn-secondary btn-rounded" data-toggle="modal" data-target="#reScheduleWedding"><i class="far fa-calendar-alt"></i> 
                        Re-Schedule
                    </button>

                    <div class="modal fade" id="reScheduleWedding" tabindex="-1" role="dialog" aria-labelledby="reScheduleWeddingLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="reScheduleWeddingLabel">Warning</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input class="form-control" type="date" name="postpone_date" value="{{ $customer->function_date }}" min="{{ date('Y-m-d') }}">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button class="btn btn-secondary" type="submit">Re-Schedule</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <a href="{{ route('customer.edit', $customer->id) }}" class="btn btn-success btn-rounded"><i class="fas fa-edit"></i> Edit</a>
                    <a href="" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#postponedDateModal"><i class="fa fa-plus"></i> Postpone</a>
                </form>
            @endif
            
            <div class="modal fade" id="postponedDateModal" tabindex="-1" role="dialog" aria-labelledby="postponedDateModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="postponedDateModalLabel">Postpone Date</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="{{ route('postpone', $customer->id) }}" method="post">
                                @csrf
                                @method('PUT')
                                <div class="form-group">
                                    <input class="form-control" type="date" name="postpone_date" value="{{ $customer->function_date }}" min="{{ date('Y-m-d') }}">
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
        </div>
    </div>
    <div class="card-box profile-header " id="profile-card">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-view">
                    <div class="profile-img-wrap">
                        <div class="profile-img">
                            <a href="#"><img class="avatar" src="{{ asset('assets/img/user.jpg') }}" alt=""></a>
                        </div>
                    </div>
                    <div class="profile-basic">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="profile-info-left">
                                    <h3 class="user-name m-t-0 mb-0">{{ $customer->name }}</h3>
                                    <div class="staff-id">Bill Number : {{ $customer->branch->prefix }}{{ $customer->bill_number }}</div>
                                    <div class="staff-id">Booked On : {{ $customer->created_at }}</div>
                                    <div class="staff-id">Branch : {{ $customer->branch->name }}</div>
                                    {{-- <div class="staff-msg"><a href="chat.html" class="btn btn-primary">Send Message</a></div> --}}
                                </div>
                            </div>
                            <div class="col-md-8">
                                <ul class="personal-info">
                                    <li>
                                        <span class="title">Phone 1</span>
                                        <span class="text"><a href="#">{{ $customer->mobile_no1 }}</a></span>
                                    </li>

                                    @if ($customer->mobile_no2 != NULL)
                                        <li>
                                            <span class="title">Phone 2</span>
                                            <span class="text"><a href="#">{{ $customer->mobile_no2 }}</a></span>
                                        </li>
                                    @endif
                                    
                                    <li>
                                        <span class="title">Address</span>
                                        <span class="text">{{ $customer->address }}</span>
                                    </li>

                                    @if ($customer->postponed == NULL)
                                        <li>
                                            <span class="title">Function Date</span>
                                            <span class="text">{{ $customer->function_date }}</span>
                                        </li>
                                    @else
                                        <li>
                                            <span class="title">Function Date</span>
                                            <span class="text">{{ $customer->function_date }}</span>
                                        </li>

                                        <li>
                                            <span class="title">Postponed From</span>
                                            <span class="text">{{ $customer->postponed }}</span>
                                        </li>
                                    @endif
                                    

                                    <li>
                                        <span class="title">Place</span>
                                        <span class="text">{{ $customer->function_place }}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>                        
            </div>
        </div>
    </div>
    <div class="profile-tabs">
        <ul class="nav nav-tabs nav-tabs-bottom">
            <li class="nav-item" id="tab0"><a class="nav-link @if (session('tab0')) active @endif" href="#measurement_tab" data-toggle="tab">Measurements</a></li>
            <li class="nav-item" id="tab1"><a class="nav-link @if (session('tab1')) active @endif" href="#dress_selection_tab" data-toggle="tab">Dress Selection</a></li>
            <li class="nav-item" id="tab2"><a class="nav-link @if (session('tab2')) active @endif" href="#bill_tab" data-toggle="tab">Bill</a></li>
            <li class="nav-item" id="tab3"><a class="nav-link @if (session('tab3')) active @endif" href="#notes_tab" data-toggle="tab">Notes</a></li>
            <li class="nav-item" id="tab4"><a class="nav-link @if (session('tab4')) active @endif" href="#other_tab" data-toggle="tab">Other</a></li>
            @if (auth()->check())
                @if (auth()->user()->is_admin())        
                    <li class="nav-item" id="tab5"><a class="nav-link @if (session('tab5')) active @endif" href="#costs_tab" data-toggle="tab">Costs</a></li>
                @endif
            @endif
            </ul>

        <div class="tab-content">
            <div class="tab-pane @if (session('tab0')) show active @endif" id="measurement_tab" >
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <h4 class="card-title">Enter Measurements</h4>
                            <table class="table table-hover ">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 120px">POS</th>
                                        <th scope="col">Head</th>
                                        <th scope="col">Shoulder</th>
                                        <th scope="col">Chest</th>
                                        <th scope="col">Weist</th>
                                        <th scope="col">T.Length</th>
                                        <th scope="col">S.Size</th>
                                        <th scope="col">ARM</th>
                                        <th scope="col">J.Height</th>
                                        <th scope="col">Other</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($customer->measurements as $measurement)
                                        <tr>
                                            <td scope="col">{{ $measurement->type }}</td>
                                            <td scope="col">
                                                @if ($measurement->head == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->head }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->shoulder == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->shoulder }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->chest == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->chest }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->weist == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->weist }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->tlength == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->tlength }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->ssize == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->ssize }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->arm == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->arm }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->jheight == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->jheight }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                @if ($measurement->other == NULL)
                                                    0
                                                @else
                                                    {{ $measurement->other }}
                                                @endif
                                            </td>
                                            <td scope="col">
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#editMeasurement{{$measurement->id}}">
                                                    Edit
                                                </button>
                                            </td>
                                        </tr>
                                        {{-- edit measurement modal --}}
                                        <div class="modal fade" id="editMeasurement{{$measurement->id}}" tabindex="-1" role="dialog" aria-labelledby="editMeasurement{{$measurement->id}}Label" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editMeasurement{{$measurement->id}}Label">Edit &nbsp;<span class="text-primary"><b>{{ $measurement->type }}</b></span>&nbsp;&nbsp; Measurements</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="{{ route('update_measurement', $measurement->id) }}" method="POST">
                                                            @csrf
                                                            @method('PUT')
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Head</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="head" class="form-control" value="@if ($measurement->head == NULL)0 @else {{ $measurement->head }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Shoulder</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="shoulder" class="form-control" value="@if ($measurement->shoulder == NULL)0 @else {{ $measurement->shoulder }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Chest</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="chest" value="@if ($measurement->chest == NULL)0 @else {{ $measurement->chest }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Weist</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="weist" value="@if ($measurement->weist == NULL)0 @else {{ $measurement->weist }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">T.Length</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="tlength" value="@if ($measurement->tlength == NULL)0 @else {{ $measurement->tlength }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">S.Size</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="ssize" value="@if ($measurement->ssize == NULL)0 @else {{ $measurement->ssize }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Arm</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="arm" value="@if ($measurement->arm == NULL)0 @else {{ $measurement->arm }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">J.Height</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="jheight" value="@if ($measurement->jheight == NULL)0 @else {{ $measurement->jheight }} @endif">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 col-form-label">Other</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" class="form-control" name="other" value="@if ($measurement->other == NULL)0 @else {{ $measurement->other }} @endif">
                                                                </div>
                                                            </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Save</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                    @php $measurement_list = []; @endphp
                                    @foreach ($customer->measurements as $measurement)
                                        @php array_push($measurement_list, $measurement->type); @endphp
                                    @endforeach

                                    @if (!in_array("GROOM", $measurement_list))
                                        <tr>
                                            <form action="{{ route('measurement.store') }}" method="post">
                                                @csrf
                                                <td>GROOM</td>
                                                <input type="hidden" name="type" value="GROOM">
                                                <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="head" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="shoulder" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="chest" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="weist" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="tlength" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="ssize" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="arm" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="jheight" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="other" class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="submit" name="submit" value="Save" id="" class="btn btn-primary btn-sm">
                                                    </div>
                                                </th>
                                            </form>
                                        </tr>
                                    @endif

                                    @for ($i = 1; $i <= $customer->no_of_bestmen; $i++)
                                        @if (!in_array("BESTMAN - ".$i, $measurement_list))
                                            <tr>
                                                <form action="{{ route('measurement.store') }}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="type" value="BESTMAN - {{$i}}">
                                                    <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                                    <td>BESTMAN - {{$i}}</td>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="head" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="shoulder" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="chest" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="weist" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="tlength" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="ssize" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="arm" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="jheight" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="other" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="submit" name="submit" value="Save" id="" class="btn btn-primary btn-sm">
                                                        </div>
                                                    </th>
                                                </form>
                                            </tr>
                                        @endif
                                    @endfor

                                    @for ($i = 0; $i < $customer->no_of_pageboys; $i++)
                                        @if (!in_array("PAGEBOY - ".$i+1, $measurement_list))
                                            <tr>
                                                <form action="{{ route('measurement.store') }}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="type" value="PAGEBOY - {{$i+1}}">
                                                    <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                                    <td>PAGEBOY - {{$i+1}}</td>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="head" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="shoulder" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="chest" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="weist" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="tlength" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="ssize" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="arm" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="jheight" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" autocomplete="off" name="other" id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="submit" name="submit" value="Save" id="" class="btn btn-primary btn-sm">
                                                        </div>
                                                    </th>
                                                </form>
                                            </tr>
                                        @endif
                                    @endfor
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane @if (session('tab1')) active @endif" id="dress_selection_tab">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box">
                            @if ($dress_selected_customer == NULL)
                                <h4 class="card-title">Dress Selection Form</h4>
                                <form action="{{ route('dress.store') }}" method="POST">
                                    @csrf
                                    <input type="hidden" value="{{ $customer->id }}" name="customer_id">
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-4">Groom's Jacket</label>
                                        <div class="col-md-8">
                                            <input name="groom_jacket" id="groom_jacket" type="text" class="form-control" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-4">Groom's Cavani</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" name="groom_cavani" id="groom_cavani" autocomplete="off">
                                        </div>
                                    </div>
                                    @for ($i = 0; $i < $customer->no_of_bestmen; $i++)
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-4">Bestman's Jacket - {{ $i+1 }}</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" name="bestman_jacket[]" id="bestman_jacket{{$i}}" autocomplete="off">
                                            </div>
                                        </div>
                                    @endfor

                                    @for ($i = 0; $i < $customer->no_of_pageboys; $i++)
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-4">Pageboy's Jacket - {{ $i+1 }}</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" name="pageboy_jacket[]" id="pageboy_jacket{{$i}}" autocomplete="off">
                                            </div>
                                        </div>
                                    @endfor

                                    <div class="form-group row">
                                        <label class="col-form-label col-md-4">Group Cavani</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" name="group_cavani" id="group_cavani" autocomplete="off">
                                        </div>
                                    </div>

                                    <div class="text-right">
                                        <input type="submit" class="btn btn-primary " name="submit">
                                    </div>
                                </form>
                            @else
                                <h4 class="card-title">All Dress Selections</h4>
                                <div class="col-md-12">
                                    <table class="table">
                                        @foreach ($dress_selected_customer as $dress)
                                            <tr>
                                                <td>{{ $dress->type }}</td>
                                                <td><a href="" class="text">{{ $dress->name }}</a> </td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#dressEdit{{ $dress->id }}">
                                                        Edit
                                                    </button>
                                                </td>
                                            </tr>
                                            <div class="modal fade" id="dressEdit{{ $dress->id }}" tabindex="-1" role="dialog" aria-labelledby="dressEdit{{ $dress->id }}Label" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="dressEdit{{ $dress->id }}Label">Edit &nbsp; <span class="text-primary">{{ $dress->type }}</span></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="{{ route('dress.update', $dress->id) }}" method="post">
                                                                @csrf
                                                                @method('PUT')
                                                                <div class="form-group row">
                                                                    <label class="col-md-4 col-form-label">{{ $dress->type }}</label>
                                                                    <div class="col-md-8">
                                                                        @if($dress->type == "Groom's Jacket")
                                                                            <input type="text" name="dress" class="form-control" value="{{ $dress->name }}" id="groom_jacket" autocomplete="off">
                                                                        @elseif($dress->type == "Groom's Cavani")
                                                                            <input type="text" name="dress" class="form-control" value="{{ $dress->name }}" id="groom_cavani" autocomplete="off">
                                                                        @elseif($dress->type == "Group Cavani")
                                                                            <input type="text" name="dress" class="form-control" value="{{ $dress->name }}" id="group_cavani" autocomplete="off">
                                                                        @else
                                                                            @for ($i = 0; $i < 8; $i++)
                                                                                @if ($dress->type == "Bestman's Jacket - ".$i+1)
                                                                                    <input type="text" name="dress" class="form-control" value="{{ $dress->name }}" id="bestman_jacket{{$i}}" autocomplete="off">
                                                                                @elseif($dress->type == "Pageboy's Jacket - ".$i+1)
                                                                                    <input type="text" name="dress" class="form-control" value="{{ $dress->name }}" id="pageboy_jacket{{$i}}" autocomplete="off">
                                                                                @endif
                                                                            @endfor
                                                                        @endif
                                                                        
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Save</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </table>
                                </div>
                                
                            @endif
                        </div>
                    </div>
                    @if ($dress_selected_customer != NULL)
                        <div class="col-lg-6" id="display_area" style="display: none">
                    @else
                        <div class="col-lg-6" id="display_area">
                    @endif
                    </div>
                </div>
            </div>
            <div class="tab-pane @if (session('tab2')) active @endif" id="bill_tab" >
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box">
                            <h4 class="card-title">Billing</h4>
                            <ul class="personal-info">
                                <li>
                                    <span class="title">Total Amount</span>
                                    <span class="text-primary"> {{ $customer->total_amount }}.00 </span>
                                </li>

                                <li>
                                    <span class="title">Discount </span>
                                    <span class="text-primary"> {{ $customer->discount }}.00 </span>
                                </li>
                                
                                <li>
                                    <span class="title">Advance Payment </span>
                                    <span class="text-primary"> {{ $customer->advance_payment }}.00 </span>
                                </li>
                                @php $intering_payment = 0; @endphp
                                @foreach ($customer->intering_payments as $value)
                                    @php $intering_payment += $value->intering_payment; @endphp
                                @endforeach
                                @php $balance = $customer->total_amount - ($customer->discount + $customer->advance_payment  + $intering_payment) @endphp
                                <li>
                                    <span class="title">Balance </span>
                                    <span class="text"><a href="#">
                                        @if ($balance == 0)
                                            <span class="text-success">Payment Success</span> 
                                        @else
                                            {{ $balance }}.00
                                        @endif
                                    </a></span>
                                </li>

                            </ul>
                            @if ($balance != 0)
                                <form action="{{ route('intering_payment.store') }}" method="POST">
                                    @csrf
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-4">Intering Payment</label>
                                        <div class="col-md-4">
                                            <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                            <input type="text" class="form-control" name="intering_payment">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="submit" class="btn btn-primary">
                                        </div>
                                    </div>
                                </form>
                            @endif
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <table class="table table-striped table-hover table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Intering Payment</th>
                                    <th scope="col">Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (count($customer->intering_payments) != 0)
                                    @php $counter = 1; @endphp
                                    @foreach ($customer->intering_payments as $intering_payment)
                                        <tr>
                                            <th scope="row">{{ $counter }}</th>
                                            <td>{{ $intering_payment->intering_payment }}.00</td>
                                            <td>{{ $intering_payment->created_at }}</td>
                                        </tr>
                                        @php $counter++; @endphp
                                    @endforeach
                                @else
                                    <tr>
                                        <td scope="row" colspan="3" class="text-center text-secondary">No Any Payments</td>
                                    </tr>  
                                @endif
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane @if (session('tab3')) active @endif" id="notes_tab">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card-box">
                            <h3 class="card-title">Add Note</h3>
                            <div class="experience-box">
                                {{-- Note creating form --}}
                                <form action="{{ route('note.store') }}" method="post" style="display: block" id="note_create_form">
                                    @csrf
                                    <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                    <div class="form-group">
                                        <label>Note</label>
                                        <textarea name="note" required class="form-control" id="" cols="30" rows="5"></textarea>
                                    </div>

                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                                {{-- Note updating form --}}
                                <form action="" method="post" style="display: none" id="note_edit_form">
                                    @csrf
                                    @method("PUT")
                                    <div class="form-group">
                                        <label>Edit Note</label>
                                        <textarea name="note" required class="form-control" id="edit_note" cols="30" rows="5"></textarea>
                                    </div>

                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-8">
                            <table class="table table-striped table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Note</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($notes as $note)
                                        <tr>
                                            <td>
                                                @if ($note->status == 1)
                                                    <input type="checkbox" checked>
                                                @else
                                                    <input type="checkbox">
                                                @endif
                                                
                                            </td>
                                            <td>{{ $note->note }}</td>
                                            <td style="width: 110px">{{ $note->created_at }}</td>
                                            <td style="width: 100px">
                                                <div class="row">
                                                    <input type="hidden" value="{{ $note->id }}" id="note_id{{$i}}">
                                                    <button type="submit" class="btn btn-warning btn-sm" name="edit" id="edit_btn{{$i}}"><i class="fal fa-edit"></i> </button>&nbsp;
                                                    <form action="{{ route('note.destroy', $note->id) }}" method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm" name="delete"><i class="far fa-trash-alt"></i> </button>&nbsp;
                                                    </form>
                                                    <form action="{{ route('note.mark_as_read', $note->id) }}" method="post">
                                                        @csrf
                                                        @method("PUT")
                                                        <button type="submit" class="btn btn-success btn-sm" name="mark_as_done"><i class="fas fa-clipboard-check"></i> </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        @php
                                            $i++;
                                        @endphp
                                    @endforeach
                                    <input type="hidden" name="" id="last_count_i" value="{{$i}}">
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane @if (session('tab4')) active @endif" id="other_tab" >
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box">
                            <h4 class="card-title">Other Details</h4>
                            <ul class="personal-info">
                                <li>
                                    <span class="title">Dressing Place </span>
                                    <span class="text-primary">
                                        @if ($customer->dressing_place == 1)
                                            In Sri Kula Medura Branch
                                        @else
                                            In Home
                                        @endif    
                                    </span>
                                </li>

                                <li>
                                    <span class="title">Going Away Change</span>
                                    <span class="text-primary">
                                        @if ($customer->going_away_change_place == NULL)
                                            Yes
                                        @else
                                            {{ $customer->going_away_change_place }}
                                        @endif
                                    </span>
                                </li>

                                @if ($customer->photography_place != NULL)
                                    <li>
                                        <span class="title">Photography Place</span>
                                        <span class="text-primary"> {{ $customer->photography_place }} </span>
                                    </li>
                                @endif
                                
                                @if ($customer->bridal_dressing_place != NULL)
                                    <li>
                                        <span class="title">Bridal Styling Place </span>
                                        <span class="text-primary"> {{ $customer->bridal_dressing_place }} </span>
                                    </li> 
                                @endif

                            </ul> <br>

                            @if ($customer->bridal_color != NULL && $customer->sec_bridal_group_color != NULL)
                                <ul class="personal-info">
                                    <h4 class="card-title">Colors of Jewlleries and Clothes</h4>
                                    
                                    @if ($customer->bridal_color != NULL)
                                        <li>
                                            <span class="title">Bride </span>
                                            <span class="text-primary"> {{ $customer->bridal_color }} </span>
                                        </li>
                                    @endif
                                    
                                    @if ($customer->sec_bridal_group_color != NULL)
                                        <li>
                                            <span class="title">second brides and group </span>
                                            <span class="text-primary"> {{ $customer->sec_bridal_group_color }} </span>
                                        </li>
                                    @endif
                                </ul>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            @if (auth()->check())
                @if (auth()->user()->is_admin())
                    <div class="tab-pane @if (session('tab5')) active @endif" id="costs_tab" >
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card-box">
                                    
                                    @if ($customer->cost == NULL)
                                        <h4 class="card-title">Enter Costs</h4>
                                        <form action="{{ route('cost.store') }}" method="POST">
                                            @csrf
                                            <input type="text" name="customer_id" hidden value="{{ $customer->id }}">
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-4">Transport</label>
                                                <div class="col-md-8">
                                                    <input name="transport" id="transport" type="text" class="form-control" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-4">Salary</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="salary" id="salary" autocomplete="off">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-form-label col-md-4">Cleaning</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="cleaning" id="cleaning" autocomplete="off">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-form-label col-md-4">Depriciation</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="depriciation" id="depriciation" autocomplete="off">
                                                </div>
                                            </div>

                                            <div class="text-right">
                                                <input type="submit" class="btn btn-primary " name="submit">
                                            </div>
                                        </form>
                                    @else
                                        <div id="cost_view_form">
                                            <h4 class="card-title">View Costs</h4>
                                                <input type="text" name="customer_id" hidden value="{{ $customer->id }}">
                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Transport</label>
                                                    <div class="col-md-8">
                                                        <input disabled name="transport" id="transport" type="text" class="form-control" autocomplete="off" value="{{ $customer->cost->transport }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Salary</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" disabled name="salary" id="salary" autocomplete="off" value="{{ $customer->cost->salary }}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Cleaning</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" disabled name="cleaning" id="cleaning" autocomplete="off" value="{{ $customer->cost->cleaning }}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Depriciation</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" disabled name="depriciation" id="depriciation" autocomplete="off" value="{{ $customer->cost->depriciation }}">
                                                    </div>
                                                </div>

                                                <div class="text-right">
                                                    <button class="btn btn-primary" onclick="showCostEditForm()">Edit</button>
                                                </div>
                                        </div>
                                        <div id="cost_edit_form">
                                            <h4 class="card-title">Edit Costs</h4>
                                            <form action="{{ route('cost.update', $customer->cost->id) }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <input type="text" name="customer_id" hidden value="{{ $customer->id }}">
                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Transport</label>
                                                    <div class="col-md-8">
                                                        <input name="transport" id="transport" type="text" class="form-control" autocomplete="off" value="{{ $customer->cost->transport }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Salary</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" name="salary" id="salary" autocomplete="off" value="{{ $customer->cost->salary }}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Cleaning</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" name="cleaning" id="cleaning" autocomplete="off" value="{{ $customer->cost->cleaning }}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-form-label col-md-4">Depriciation</label>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" name="depriciation" id="depriciation" autocomplete="off" value="{{ $customer->cost->depriciation }}">
                                                    </div>
                                                </div>

                                                <div class="text-right">
                                                    <input type="submit" class="btn btn-primary " name="submit">
                                                </div>
                                            </form>
                                        </div>
                                    @endif
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            @endif        
        </div>
    </div>

    {{-- Autocompleting Text Fields --}}
    <script>
        $('#cost_edit_form').hide()
        $('#cost_view_form').show()
        function showCostEditForm() {
            $('#cost_edit_form').show()
            $('#cost_view_form').hide()
        }

        var path = "{{ route('autocomplete_groom_jacket')  }}";
        $('#groom_jacket').typeahead({
            minLength: 2,
            source:  function (query, process) {
                return $.get(path, { term: query }, function (data) {
                    return process(data);
                });
            },
            afterSelect: function (item) {
                $.ajax({
                    url: "../item/"+item,
                    type: "GET",
                    success: function(data){
                        image_url = "{{ asset('storage/item/') }}"
                        image_url += '/'
                        image_url += data.image
                        $('#display_area').html("<img src='" + image_url + "' class='rounded mx-auto d-block img-thumbnail'>")
                    }
                })
            }
        });

        var path1 = "{{ route('autocomplete_groom_cavani')  }}";
        $('#groom_cavani').typeahead({
            minLength: 2,
            source:  function (query1, process1) {
                return $.get(path1, { term1: query1 }, function (data1) {
                    return process1(data1);
                });
            },
            afterSelect: function (item) {
                $.ajax({
                    url: "../item/"+item,
                    type: "GET",
                    success: function(data){
                        image_url = "{{ asset('storage/item/') }}"
                        image_url += '/'
                        image_url += data.image
                        $('#display_area').html("<img src='" + image_url + "' class='rounded mx-auto d-block img-thumbnail'>")
                    }
                })
            }
        });

        for (let index = 0; index < 5; index++) {
            var path2 = "{{ route('autocomplete_bestman_jacket')  }}";
            $('#bestman_jacket'+index).typeahead({
                minLength: 2,
                source:  function (query2, process2) {
                    return $.get(path2, { term2: query2 }, function (data2) {
                        return process2(data2);
                    });
                },
                afterSelect: function (item) {
                    $.ajax({
                        url: "../item/"+item,
                        type: "GET",
                        success: function(data){
                            image_url = "{{ asset('storage/item/') }}"
                            image_url += '/'
                            image_url += data.image
                            $('#display_area').html("<img src='" + image_url + "' class='rounded mx-auto d-block img-thumbnail'>")
                        }
                    })
                }
            });
        }
        
        for (let index = 0; index < 5; index++) {
            var path3 = "{{ route('autocomplete_pageboy_jacket')  }}";
            $('#pageboy_jacket'+index).typeahead({
                minLength: 2,
                source:  function (query3, process3) {
                    return $.get(path3, { term3: query3 }, function (data3) {
                        return process3(data3);
                    });
                },
                afterSelect: function (item) {
                    $.ajax({
                        url: "../item/"+item,
                        type: "GET",
                        success: function(data){
                            image_url = "{{ asset('storage/item/') }}"
                            image_url += '/'
                            image_url += data.image
                            $('#display_area').html("<img src='" + image_url + "' class='rounded mx-auto d-block img-thumbnail'>")
                        }
                    })
                }
            });
        }

        var path4 = "{{ route('autocomplete_group_cavani')  }}";
        $('#group_cavani').typeahead({
            minLength: 2,
            source:  function (query4, process4) {
                return $.get(path4, { term4: query4 }, function (data4) {
                    return process4(data4);
                });
            },
            afterSelect: function (item) {
                $.ajax({
                    url: "../item/"+item,
                    type: "GET",
                    success: function(data){
                        image_url = "{{ asset('storage/item/') }}"
                        image_url += '/'
                        image_url += data.image
                        $('#display_area').html("<img src='" + image_url + "' class='rounded mx-auto d-block img-thumbnail'>")
                    }
                })
            }
        });
    </script>
@endsection     