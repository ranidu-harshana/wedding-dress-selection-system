@extends('layouts.app')

@section('content')
    <div class="col-md-6">
        <div class="card-box">
            
            <h4 class="card-title">Edit User</h4>
            <form method="POST" action="{{ route('user.update', $user->id) }}">
                @csrf
                @method('PUT')
                <div class="row mb-3">
                    <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                    <div class="col-md-6">
                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $user->name }}" required autocomplete="name" autofocus>

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
                        <input id="email" disabled type="email" class="form-control" value="{{ $user->email }}">
                        
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="user_role" class="col-md-4 col-form-label text-md-end">{{ __('User Role') }}</label>

                    <div class="col-md-6">
                        <select name="user_role" id="user_role" class="form-control">
                            <option value="{{ $user->role->id }}">{{ $user->role->name }}</option>
                            @foreach ($roles as $role)
                                @if ($role->id != $user->role->id)
                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="row mb-3" id="not_admin">
                    <label for="branch_name" class="col-md-4 col-form-label text-md-end">{{ __('Branch Name') }}</label>

                    <div class="col-md-6">
                        @foreach ($user->branches as $branch)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" disabled checked>
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

@endsection