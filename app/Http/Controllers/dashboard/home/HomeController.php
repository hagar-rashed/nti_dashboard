<?php

namespace App\Http\Controllers\dashboard\home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        return view('dashboard.home.home');
    }
}
