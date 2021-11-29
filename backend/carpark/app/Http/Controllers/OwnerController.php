<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\Owner;

class OwnerController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function dene(){
        $res = Owner::query()->get();
        print_r($res);
    }

    public function create(){
        $new = new Owner();
        $new->name = "DENEME OWNER";
        $new->save();
        return response("success", 200);
    }

    public function show(){
        $obj = Owner::query()->get();
       
        return response(["data"=>$obj]);
    }

    

}
