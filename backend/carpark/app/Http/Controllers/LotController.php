<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateLotRequest;
use App\Models\Lot;

class LotController extends Controller
{

    public function update(UpdateLotRequest $request)
    {
        $id = $request->id;
        $status = $request->status;
        $wrong_plate = $request->wrong_plate;

        $lot = Lot::query()->where("id", $id)->first();
        if (empty($lot)) {
            return failure_response(["Veri bulunamadı"]);
        }
        $lot->status =  $status;
        $lot->wrong_plate = $wrong_plate;
        $lot->save();
        $response = collect();
        $response->push([
            "id"=>$id,
            "status" => $status,
            "wrong_plate"=>$wrong_plate
        ]);
        return success_response($response);
    }
}
