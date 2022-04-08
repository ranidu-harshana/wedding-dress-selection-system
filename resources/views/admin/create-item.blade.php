@extends('layouts.app')

@section('content')
    <div class="col-md-6">
        <div class="card-box">
            <h4 class="card-title">Create Item</h4>

            
            <form action="{{ route('item.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label>Item Category</label>
                    <select name="item_category_id" id="" class="form-control" required>
                        <option value="">Select Category</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->cat_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Item Code</label>
                    <input name="item_code" type="text" required class="form-control @error('item_code') is-invalid @enderror">
                    @error('item_code') <p class="text-danger">{{$message}}</p> @enderror
                </div>

                <div class="form-group">
                    <label>Item Description</label>
                    <textarea name="item_desc" class="form-control" required name="" id="" cols="30" rows="5"></textarea>
                </div>
                <div class="form-group">
                    <label>Item Type</label>
                    <select name="item_type" id="" class="form-control" required>
                        <option value="">Select Type</option>
                        <option value="Bestman">Bestman</option>
                        <option value="Groom">Groom</option>
                        <option value="Pageboy">Pageboy</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Item Image</label>
                    <input name="item_image_url" type="file" required class="form-control">
                    @error('item_image_url') <p class="text-danger">{{$message}}</p> @enderror
                </div>

                <div class="text-right">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection