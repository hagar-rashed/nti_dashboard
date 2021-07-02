<?php

namespace App\Http\Controllers\dashboard\products;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\traits\generalTrait;
use Illuminate\Validation\Rule;
class ProductController extends Controller
{
    use generalTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = DB::select('SELECT `products`.* FROM `products` ORDER BY `products`.`created_at` DESC');
        return view('dashboard.products.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $brands = DB::select("SELECT `brands`.* FROM `brands` ORDER BY `brands`.`name` ASC");
        $subCategories = DB::table('subcategories')->select('id','name')->orderBy('name')->get();
        return view('dashboard.products.create',compact('brands','subCategories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $rules  = [
            'name'=>['required','string','max:100'],
            'code'=>['required','integer','digits:5','min:10000','max:99999' , 'unique:products'],
            'price'=>['required','digits_between:1,8'],
            'quantity'=>['required','integer','min:1'],
            'status'=>['required','boolean'],
            'brand_id'=>['required','integer','exists:brands,id'],
            'subcategory_id'=>['required','integer','exists:subcategories,id'],
            'details'=>['nullable','string'],
            'image'=>['required','mimes:png,jpg,jpeg','max:1000']
        ];
        $request->validate($rules);
        // upload image
        $photoName = $this->uploadPhoto($request->image,'products');
        // insert data
        $data = $request->except('_token','image','add');
        $product_id = DB::table('products')->insertGetId($data);
        DB::table('products_images')->insert(['image'=>$photoName,'product_id'=>$product_id,'primary_image'=>1]);
        // redirect on page
        if($request->add == 'add')
            return redirect()->route('products.index')->with('Success','Product Has Been Successfully Created');
        else
            return redirect()->back()->with('Success','Product Has Been Successfully Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $products = DB::select("SELECT `products`.* FROM `products` WHERE `products`.id = $id")[0];
        // dd($products[0]) ;
        $brands = DB::select("SELECT `brands`.* FROM `brands` ORDER BY `brands`.`name` ASC");
        $subCategories = DB::table('subcategories')->select('id','name')->orderBy('name')->get();
        return view('dashboard.products.edit',compact('brands','subCategories','products'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // return $request->all();
        $rules  = [
            'name'=>['required','string','max:100'],
            'code'=>['required','integer','digits:5','min:10000','max:99999',Rule::unique('products')->ignore($id,'id')], 
            'price'=>['required','digits_between:1,8'],
            'quantity'=>['required','integer','min:1'],
            'status'=>['required','boolean'],
            'brand_id'=>['required','integer','exists:brands,id'],
            'subcategory_id'=>['required','integer','exists:subcategories,id'],
            'details'=>['nullable','string'],
            'image'=>['nullable','mimes:png,jpg,jpeg','max:1000']
        ];
        $request->validate($rules);
        if($request->has('image')){
        // upload image

        $photoName = $this->uploadPhoto($request->image,'products');
        DB::table('products_images')->where('id', "=",$id)->insert(['image'=>$photoName]);
        }

        // insert data
        $data = $request->except('_token','image','add' , 'update' , '_methode');
        DB::table('products')-> where('id' ,  $id)->update($data);

        // redirect on page
        if($request->update == 'update')
            return redirect()->route('products.index')->with('Success','Product Has Been Successfully updated');
        else
            return redirect()->back()->with('Success','Product Has Been Successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
