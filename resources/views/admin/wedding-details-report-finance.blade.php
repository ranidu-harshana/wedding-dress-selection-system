@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Get Reservation Details - By Month</h4>
                <form action="{{ route('reservation_report_pdf_finance_month') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label>Month: </label>
                        <input type="month" name="month" class="form-control">
                    </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Generate</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Get Reservation Details - By Range</h4>
                <form action="{{ route('reservation_report_pdf_finance_range') }}" method="POST">
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