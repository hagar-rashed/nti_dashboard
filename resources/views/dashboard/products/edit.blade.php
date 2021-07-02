
@extends('dashboard.layout.app')
@section('title', 'Edit Product')
@section('card-color', 'card-warning')
@section('content')
    @include('dashboard.includes.message')
    <form method='post' action="{{ route('products.update',$products->id) }}" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <input type="hidden" name="oldPhoto" id="" value="{{$products->image}}">
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="inputEmail4d">Name</label>
                <input type="text" name="name" class="form-control  @error('name') is-invalid @enderror" id="inputEmail4d"
                    value="{{ $products->name }}">
            </div>
        </div>
        @error('name')
            <div class="alert alert-danger"> {{ $message }} </div>
        @enderror
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="inputPassword4">Code</label>
                <input type="number" name="code" class="form-control @error('code') is-invalid @enderror"
                    id="inputPassword4" value="{{$products->code }}">
                @error('code')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>

            <div class="form-group col-md-4">
                <label for="inputAddress">Price</label>
                <input type="number" name="price" class="form-control @error('price') is-invalid @enderror"
                    id="inputAddress" placeholder="1234 Main St" value="{{ $products->price }}">
                @error('price')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>

            <div class="form-group col-md-4">
                <label for="inputAddress2">Quantity</label>
                <input type="number" name="quantity" class="form-control @error('quantity') is-invalid @enderror"
                    id="inputAddress2" placeholder="Apartment, studio, or floor" value="{{ $products->quantity }}">
                @error('quantity')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>

        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="inputStates">Status</label>
                <select name="status" id="inputStates" class="form-control @error('status') is-invalid @enderror">
                    <option {{ $products->status == 1 ? 'selected' : '' }} value="1">Active</option>
                    <option {{ $products->status == 0 ? 'selected' : '' }} value="0">Not Active</option>
                </select>
                @error('status')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>
            <div class="form-group col-md-4">
                <label for="inputStated">Brand</label>
                <select name="brand_id" id="inputStated" class="form-control @error('brand_id') is-invalid @enderror">
                    <option value="">No Brand</option>
                    @foreach ($brands as $key => $brand)
                        <option {{ $products->brand_id == $brand->id ? 'selected' : '' }} value="{{ $brand->id }}">
                            {{ $brand->name }}</option>
                    @endforeach
                </select>
                @error('brand_id')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>
            <div class="form-group col-md-4">
                <label for="inputStateq">Sub-Category</label>
                <select name="subcategory_id" id="inputStateq"
                    class="form-control @error('subcategory_id') is-invalid @enderror">
                    @foreach ($subCategories as $key => $subcat)
                        <option {{ $products->subcategory_id == $subcat->id ? 'selected' : '' }} value="{{ $subcat->id }}">
                            {{ $subcat->name }}</option>
                    @endforeach
                </select>
                @error('subcategory_id')
                    <div class="alert alert-danger"> {{ $message }} </div>
                @enderror
            </div>

        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <textarea name="details" class="form-control @error('description') is-invalid @enderror" id="" cols="30"
                    rows="10">{{ $products->details }}</textarea>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <img src="{{asset('images/products/'.$products->image)}}" alt="{{$products->name}}">
            </div>
            <div class="form-group col-md-12">
                <label for="inputEmail4">Image</label>
                <input type="file" name="image" class="form-control @error('image') is-invalid @enderror" id="inputEmail4">
            </div>
            @error('image')
                <div class="alert alert-danger"> {{ $message }} </div>
            @enderror
        </div>

        <button type="submit" class="btn btn-warning" name="update" value="update">Update Product</button>
        <button type="submit" class="btn btn-outline-warning" name="update" value='update_return'>Update_Return</button>
    </form>
@endsection
