@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-sm-7 col-6">
            <h4 class="page-title">Customer Profile</h4>
        </div>

        <div class="col-sm-5 col-6 text-right m-b-30">
            <a href="" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#postponedDateModal"><i class="fa fa-plus"></i> Postpone</a>
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
                                    <input class="form-control" type="date" name="postpone_date" value="{{ $customer->function_date }}">
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
                                    <div class="staff-id">Bill Number : {{ $customer->bill_number }}</div>
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
            <li class="nav-item" id="tab0"><a class="nav-link @if (session('tab0')) active @endif" href="#measurement_tab" data-toggle="tab">Mesurements</a></li>
            <li class="nav-item" id="tab1"><a class="nav-link @if (session('tab1')) active @endif" href="#dress_selection_tab" data-toggle="tab">Dress Selection</a></li>
            <li class="nav-item" id="tab2"><a class="nav-link @if (session('tab2')) active @endif" href="#bill_tab" data-toggle="tab">Bill</a></li>
            <li class="nav-item" id="tab3"><a class="nav-link @if (session('tab3')) active @endif" href="#notes_tab" data-toggle="tab">Notes</a></li>
            <li class="nav-item" id="tab4"><a class="nav-link @if (session('tab4')) active @endif" href="#other_tab" data-toggle="tab">Other</a></li>
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
                                        <td scope="col">{{ $measurement->head }}</td>
                                        <td scope="col">{{ $measurement->shoulder }}</td>
                                        <td scope="col">{{ $measurement->chest }}</td>
                                        <td scope="col">{{ $measurement->weist }}</td>
                                        <td scope="col">{{ $measurement->tlength }}</td>
                                        <td scope="col">{{ $measurement->ssize }}</td>
                                        <td scope="col">{{ $measurement->arm }}</td>
                                        <td scope="col">{{ $measurement->jheight }}</td>
                                        <td scope="col">{{ $measurement->other }}</td>
                                    </tr>
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
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="head" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="shoulder" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="chest" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="weist" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="tlength" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="ssize" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="arm" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="jheight" required class="form-control">
                                                    </div>
                                                </th>
                                                <th scope="row">
                                                    <div class="form-group">
                                                        <input type="text" onkeypress="return isNumberKey(event)" name="other" required class="form-control">
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
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="head" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="shoulder" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="chest" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="weist" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="tlength" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="ssize" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="arm" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="jheight" required class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="other" required class="form-control">
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
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="head" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="shoulder" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="chest" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="weist" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="tlength" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="ssize" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="arm" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="jheight" required id="" class="form-control">
                                                        </div>
                                                    </th>
                                                    <th scope="row">
                                                        <div class="form-group">
                                                            <input type="text" onkeypress="return isNumberKey(event)" name="other" required id="" class="form-control">
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
                                <h4 class="card-title">Dress Selection Update Form</h4>
                                <div class="col-md-12">
                                    <table class="table">
                                        @foreach ($dress_selected_customer as $dress)
                                            <tr>
                                                <td>{{ $dress->type }}</td>
                                                <td><a href="" class="text">{{ $dress->name }}</a> </td>
                                                <td><button class="btn btn-primary btn-sm">Edit</button> </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                </div>
                                
                            @endif
                        </div>
                    </div>
                    <div class="col-lg-6" id="display_area">
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
                                        <input name="note" type="text" required class="form-control">
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
                                        <input name="note" type="text" required class="form-control" id="edit_note">
                                    </div>

                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-8">
                        <div class="card-box">
                            <h3 class="card-title">All Notes</h3>
                            <div class="experience-box">
                                <div class="table-responsive">
									<table class="table mb-0">
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
                                                    <td>{{ $note->created_at }}</td>
                                                    <td>
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
        </div>
    </div>

    {{-- Autocompleting Text Fields --}}
    <script>
        
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