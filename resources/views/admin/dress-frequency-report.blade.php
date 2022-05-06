@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Dress Frequency Report</h4>
                <form action="{{ route('dress_freq_report') }}" method="POST" formtarget="_blank" target="_blank">
                    @csrf
                    <div class="form-group">
                        <label>Type: </label>
                        <select name="type" id="" class="form-control">
                            <option value="">Select</option>
                            <option value="Groom's Jacket">Groom's Jacket</option>
                            <option value="Groom's Cavani">Groom's Cavani</option>
                            <option value="Bestman's Jacket">Bestman's Jacket</option>
                            <option value="Pageboy's Jacket">Pageboy's Jacket</option>
                            <option value="Group Cavani">Group Cavani</option>
                        </select>
                    </div>

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