@extends('layouts.app')

@section('content')
    <div class="col-md-6">
        <div class="card-box">
            <h4 class="card-title">Create Item</h4>

            
            <form action="{{ route('item.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label>Item Category</label>
                    <select name="item_category_id" value="{{ old('item_category_id') }}" id="" class="form-control" required>
                        <option value="">Select Category</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->cat_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Item Code</label>
                    <input name="item_code" type="text" value="{{ old('item_code') }}" required class="form-control @error('item_code') is-invalid @enderror">
                    @error('item_code') <p class="text-danger">{{$message}}</p> @enderror
                </div>

                <div class="form-group">
                    <label>Item Description</label>
                    <input name="item_desc" type="text" value="{{ old('item_desc') }}" required class="form-control @error('item_desc') is-invalid @enderror">
                    @error('item_desc') <p class="text-danger">{{$message}}</p> @enderror
                </div>
                <div class="form-group">
                    <label>Item Type</label>
                    <select name="item_type" value="{{ old('item_type') }}" id="" class="form-control" required>
                        <option value="">Select Type</option>
                        <option value="Bestman">Bestman</option>
                        <option value="Groom">Groom</option>
                        <option value="Pageboy">Pageboy</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Item Image</label>
                    <input name="item_image_url" value="{{ old('item_image_url') }}" type="file" class="form-control">
                    @error('item_image_url') <p class="text-danger">{{$message}}</p> @enderror
                </div>

                <div class="text-right">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection