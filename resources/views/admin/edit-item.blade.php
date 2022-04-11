@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="card-box">
                <h4 class="card-title">Create Item</h4>
                
                <form action="{{ route('item.update', $item->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label>Item Category</label>
                        <select name="item_category_id" id="" class="form-control" required>
                            <option value="{{ $item->item_category_id }}">{{ $item->item_category->cat_name }}</option>
                            @foreach ($categories as $category)
                                @if ($item->item_category->cat_name != $category->cat_name)
                                    <option value="{{ $category->id }}">{{ $category->cat_name }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Item Code</label>
                        <input name="item_code" type="text" required class="form-control @error('item_code') is-invalid @enderror" value="{{ $item->item_code }}" autocomplete="off">
                        @error('item_code') <p class="text-danger">{{$message}}</p> @enderror
                    </div>

                    <div class="form-group">
                        <label>Item Description</label>
                        <input name="item_desc" type="text" value="{{ $item->item_desc }}" required class="form-control @error('item_desc') is-invalid @enderror" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label>Item Type</label>
                        <select name="item_type" id="" class="form-control" required>
                            @if ($item->item_type == "Bestman")
                                <option value="Bestman">Bestman</option>
                                <option value="Groom">Groom</option>
                                <option value="Pageboy">Pageboy</option>
                            @elseif($item->item_type == "Groom")
                                <option value="Groom">Groom</option>
                                <option value="Bestman">Bestman</option>
                                <option value="Pageboy">Pageboy</option>
                            @else
                                <option value="Pageboy">Pageboy</option>
                                <option value="Bestman">Bestman</option>
                                <option value="Groom">Groom</option>
                            @endif
                            
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label>Item Image</label>
                        <input name="item_image_url" type="file"  class="form-control">
                        @error('item_image_url') <p class="text-danger">{{$message}}</p> @enderror
                    </div>
                        <div class="col-md-3 col-sm-3 col-4 col-lg-3 col-xl-2">
                            <div class="product-thumbnail">
                            
                                <img src="{{ asset('storage/item/'.$item->item_image_url) }}" class="img-thumbnail img-fluid" alt="">
                                <span class="product-remove" title="remove"><i class="fa fa-close"></i></span>
                            </div>
                        </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-md-6">
            <img src="{{ asset('storage/item/'.$item->item_image_url) }}" alt="" class="image-responsive" width="100%">
        </div>
    </div>
@endsection