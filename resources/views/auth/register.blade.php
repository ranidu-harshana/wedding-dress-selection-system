@extends('layouts.app')

@section('content')
    <div class="col-md-6">
        <div class="card-box">
            
            <h4 class="card-title">Create User</h4>
            <form method="POST" action="{{ route('register') }}">
                @csrf

                <div class="row mb-3">
                    <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                    <div class="col-md-6">
                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('Email Address') }}</label>

                    <div class="col-md-6">
                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="user_role" class="col-md-4 col-form-label text-md-end">{{ __('User Role') }}</label>

                    <div class="col-md-6">
                        <select name="user_role" id="user_role" required class="form-control">
                            <option value="">Select</option>
                            <option value="1">Admin</option>
                            <option value="2">Manager</option>
                            <option value="3">Standard User</option>
                        </select>

                        @error('user_role')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3" id="not_admin">
                    <label for="branch_name" class="col-md-4 col-form-label text-md-end">{{ __('Branch Name') }}</label>

                    <div class="col-md-6">
                        @foreach ($branches as $branch)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="{{ $branch->id }}" name="branches[]" id="branches{{ $branch->id }}">
                                <label class="form-check-label" for="branches{{ $branch->id }}">
                                    {{ $branch->name }}
                                </label>
                            </div>
                        @endforeach
                        @if($errors->has('branches'))
                            <div class="error text-danger small"><strong>{{ $errors->first('branches') }}</strong></div>
                        @endif
                    </div>
                </div>
                
                <div class="row mb-3" id="admin">
                    <label for="branch_name" class="col-md-4 col-form-label text-md-end">{{ __('Branch Name') }}</label>

                    <div class="col-md-6">
                        @foreach ($branches as $branch)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" checked value="{{ $branch->id }}" name="branches[]" id="branches{{ $branch->id }}">
                                <label class="form-check-label" for="branches{{ $branch->id }}">
                                    {{ $branch->name }}
                                </label>
                            </div>
                        @endforeach
                        @if($errors->has('branches'))
                            <div class="error text-danger small"><strong>{{ $errors->first('branches') }}</strong></div>
                        @endif
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="password" class="col-md-4 col-form-label text-md-end">{{ __('Password') }}</label>

                    <div class="col-md-6">
                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="password-confirm" class="col-md-4 col-form-label text-md-end">{{ __('Confirm Password') }}</label>

                    <div class="col-md-6">
                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                    </div>
                </div>

                <div class="row mb-0">
                    <div class="col-md-6 offset-md-4">
                        <button type="submit" class="btn btn-primary">
                            {{ __('Register') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $('#admin').hide();
            $("#user_role").change(function(){
                var user_role = $('#user_role').val()
                if(user_role == 1) {
                    $('#not_admin').hide();
                    $('#admin').show();
                }else{
                    $('#not_admin').show();
                    $('#admin').hide();
                }
            });
        });
    </script>
@endsection