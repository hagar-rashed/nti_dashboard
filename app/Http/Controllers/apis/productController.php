<?php

namespace App\Http\Controllers\apis;
use App\Models\Product;
use App\Models\brand;
use App\Models\Subcategory;
use App\Models\ProductsImages;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class productController extends Controller
{
    public  function index()
    {
        $products = Product::select('id','name','price','quantity','code')->orderBy('price','DESC')->get();

        return $this->returnData('products',$products);
    }
    public function create()
    {
        $brands = Brand::select('id','name')->get();
        $subCategories = Subcategory::select('id','name')->get();
        return $this->returnData('data',['brands'=>$brands,'subcategories'=>$subCategories]);
    }
    public function edit($id)
    {
        $product = Product::find($id);
        return $this->returnData('product',$product);
    }
    public function delete($id)
    {

        Product::find($id)->delete();

        $images = ProductsImages::where('product_id',$id)->get();

        ProductsImages::where('product_id',$id)->delete();

        foreach($images AS $key=>$image){

            $oldPath = public_path('images\products\\'.$image['image']);
            if(file_exists($oldPath)){
                unlink($oldPath);
            }

        }
        return $this->returnSuccessMessage("Product Has been Successfully Deleted",200);

    }
    public function store(Request $request)
    {
        // return $request->all();
        // vildate
        $rules  = [
            'name'=>['required','string','max:255'],
            'code'=>['required','integer','digits:5','min:10000','max:99999','unique:products'],
            'price'=>['required','numeric','max:100000'],
            'quantity'=>['required','integer','min:1'],
            'status'=>['required','boolean'],
            'brand_id'=>['required','integer','exists:brands,id'],
            'subcategory_id'=>['required','integer','exists:subcategories,id'],
            'description'=>['nullable','string'],
            'image'=>['required','mimes:png,jpg,jpeg','max:1000']
        ];
        // $request->validate($rules);
        $validator = Validator::make($request->all(),$rules);
        if($validator->fails()){
            return $this->returnValidationError($validator);
        }
        // upload photo
        $photoName = $this->uploadPhoto($request->image,'products');
        // insert data
        // $data = $request->except('image');
        // $data['image'] = $photoName;

        $product = new Product;
        $product->name = $request->name;
        $product->code = $request->code;
        $product->price = $request->price;
        $product->quantity = $request->quantity;
        $product->status = $request->status;
        $product->brand_id = $request->brand_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->description = $request->description;
        $product->save();
        ProductsImages::create(['image'=>$photoName,'primary_image'=>1,'product_id'=>$product->id]);
        // return response json
        return $this->returnSuccessMessage("product has been successfully created",200);
    }
}

