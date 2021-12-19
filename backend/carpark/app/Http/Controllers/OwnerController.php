<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\Owner;
use App\Http\Requests\CreateOwnerRequest;

class OwnerController extends Controller
{
   

    public function store(CreateOwnerRequest $request ){
        
        $new =  Owner::create($request->all());
       
        return success_response($new);
    }

    public function index(){
        return success_response(Owner::query()->get());
    }

    public function show(int $id){
        $owner = Owner::query()->where("id", $id)->first();

        if(!$owner){
            return failure_response(["Veri bulunamadı"]);
        }

       
        return success_response($owner);
    }

    

}
