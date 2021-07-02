<?php

namespace App\traits;

trait generalTrait {

    public function uploadPhoto($image,$folder)
    {
       $fileName = time() . '.' . $image->extension();
       $image->move(public_path('images/'.$folder),$fileName);
       return $fileName;
    }

}
