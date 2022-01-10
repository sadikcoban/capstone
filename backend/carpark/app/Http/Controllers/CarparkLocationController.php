<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\Owner;
use App\Http\Requests\CreateCarparkLocationRequest;
use App\Http\Requests\CreateLocationWithLotsRequest;
use App\Models\Camera;
use App\Models\CarparkLocation;
use App\Models\Floor;
use App\Models\Lot;

class CarparkLocationController extends Controller
{


    public function store(CreateCarparkLocationRequest $request)
    {

        $new =  CarparkLocation::create($request->all());

        return success_response(["message" => "Başarılı"]);
    }

    public function index($owner_id)
    {
        $locations = CarparkLocation::query()->where("owner_id", $owner_id)->get();
        if(!$locations){
            return failure_response(["Veri bulunamadı"]);
   
        }
        return success_response($locations);
    }

    public function show(int $id)
    {
        $location = CarparkLocation::query()->where("id", $id)->first();
    

        if (!$location) {
            return failure_response(["Veri bulunamadı"]);
        }


        return success_response($location);
    }

    public function createWithLots(CreateLocationWithLotsRequest $request)
    {
        $owner_id = $request->owner_id;
        $address = $request->address;
        $capacity = $request->capacity;
        $start_hour = $request->start_hour;
        $end_hour = $request->end_hour;
        $lon = $request->lon;
        $lat = $request->lat;
        $price_per_hour = $request->price_per_hour;
        $explanation = $request->explanation;
        $city_id = $request->city_id;

        $new_location = CarparkLocation::create([
            'owner_id' => $owner_id,
            'address' => $address,
            'capacity' => $capacity,
            'start_hour' => $start_hour,
            'end_hour' => $end_hour,
            'lat' => $lat,
            'lon' => $lon,
            'is_active' => 1,
            'price_per_hour' => $price_per_hour,
            "explanation" => $explanation,
            'city_id' => $city_id
        ]);

        $floors = $request->floors;

        foreach ($floors as $floor) {
            $new_floor = Floor::create([
                "carpark_location_id" => $new_location->id,
                "name" => $floor["floor_name"],
            ]);

         
            $lotgroups = $floor["lot_groups"];
            foreach ($lotgroups as $lot_group) {
                $new_camera = Camera::create([
                    "floor_id" => $new_floor->id,
                    "identifier" => $lot_group["cam_identifier"]
                ]);

                $lots = $lot_group["lots"];
                foreach ($lots as $lot) {
                    $new_lot = Lot::create([
                        "camera_id" => $new_camera->id,
                        "status" => "",
                        "name" => $lot["lot_name"],
                        "coord_x1" => $lot["x1"],
                        "coord_x2" => $lot["x2"],
                        "coord_y1" => $lot["y1"],
                        "coord_y2" => $lot["y2"],
                    ]);
                }
            }
        }

        return success_response(["message" => "Başarılı"]);
    }

    public function getNearLocations($city_id){
        $locations = CarparkLocation::query()
                        ->where("city_id", $city_id)
                        ->get();
        if(!$locations){
            return failure_response(["message" => "Park Alanı Bulunamadı"]);
        }
        return success_response($locations);
        
    }

   


}
