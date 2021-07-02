<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductsImages extends Model
{
    use HasFactory;
    protected $fillable = ['image','primary_image','product_id'];
    public $timestamps = false;
}
