@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Dress Frequency Report</h4>
                <form action="{{ route('dress_freq_report') }}" method="POST" formtarget="_blank" target="_blank">
                    @csrf
                    <div class="form-group">
                        <label>From: </label>
                        <input type="date" name="from_date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>To: </label>
                        <input type="date" name="to_date" class="form-control">
                    </div>
                
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Generate</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection