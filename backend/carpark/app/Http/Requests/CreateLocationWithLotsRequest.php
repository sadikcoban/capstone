<?php

namespace App\Http\Requests;

class CreateLocationWithLotsRequest extends FormRequest
{
    public  function rules()
    {
        return [
            'owner_id' => 'required|exists:owners,id',
            'address'  => 'required',
            'capacity' => 'integer|required',
            'start_hour' => 'integer|between:1,24|required',
            'end_hour'  => 'integer|between:1,24|required',
            'lat'   => 'required|string',
            'lon'       => 'required|string',
            'explanation' => 'required',
            'city_id'  => 'required|integer|between:1,81',


            'floors' => "required|array",
            'floors.*.floor_name' => 'required|string',
            'floors.*.lot_groups' => 'required|array',
            'floors.*.lot_groups.*.cam_identifier' => 'required|string',
            'floors.*.lot_groups.*.lots' => 'required|array',
            'floors.*.lot_groups.*.lots.*.lot_name' => 'required|string',
            'floors.*.lot_groups.*.lots.*.x1' => 'required|numeric',
            'floors.*.lot_groups.*.lots.*.x2' => 'required|numeric',
            'floors.*.lot_groups.*.lots.*.y1' => 'required|numeric',
            'floors.*.lot_groups.*.lots.*.y2' => 'required|numeric',
            'city_id.required'  => 'Şehir Kodu Seçiniz',
            'city_id.integer'  => 'Geçersiz Şehir Kodu',
            'city_id.between'  => 'Geçersiz Şehir Kodu',

            

        ];
    }

    public  function messages()
    {
        return [
            'lon.required'    => "Lütfen Longtitude Alanını Giriniz!",
            'lon.string'       => "Geçersiz Longtitude!",
            'lat.required'    => "Lütfen Latitude Alanını Giriniz!",
            'lat.string'       => "Geçersiz Latitude!",
            'end_hour.numeric' => 'Geçersiz Kapanış Saati Verisi',
            'end_hour.between' => 'Geçersiz Kapanış Saati Verisi',
            'end_hour.required' => 'Lütfen Kapanış Saatini Giriniz',
            'start_hour.required' => 'Lütfen Açılış Saatini Giriniz',
            'start_hour.numeric' => 'Geçersiz Açılış Saati Verisi',
            'start_hour.between' => 'Geçersiz Açılış Saati Verisi',
            'capacity.integer'  => 'Kapasite Integer Olmak Zorunda',
            'capacity.required'  => 'Lütfen Kapasite Bilgisini Giriniz',
            'owner_id.required'  => 'Geçersiz Şirket Bilgisi',
            'owner_id.numeric'  => 'Geçersiz Şirket Bilgisi',
            'owner_id.exists'  => 'Geçersiz Şirket Bilgisi',
            'address.required'   => 'Lütfen Adres Bilgisini Giriniz',
            'owner_id.required'  => "Şirket Bilgisini Giriniz",
            'owner_id.exists'  => "Geçersiz Şirket Bilgisi",
            "explanation.required" => "Lütfen Park Alanınıza Dair Açıklama Bilgisi Giriniz",


            'floors.required'    => "Lütfen Kat Bilgilerini Giriniz!",
            'floors.array'    => "Kat Bilgileri Array Tipinde Olmalıdır!",
            'floors.*.floor_name.required'    => "Lütfen Kat İsimlerini Giriniz!",
            'floors.*.floor_name.string'    => "Geçersiz Kat İsmi!",
            'floors.*.lot_groups.required'    => "Lütfen Park Alan Bilgilerini Giriniz!",
            'floors.*.lot_groups.array'    => "Park Alan Bilgileri Array Tipinde Olmalıdır!",
            'floors.*.lot_groups.*.cam_identifier.required'    => "Camera Bilgisini Giriniz!",
            'floors.*.lot_groups.*.cam_identifier.string'    => "Geçersiz Camera Bilgisi!",
            'floors.*.lot_groups.*.lots.array'    => "Park Alan Bilgileri Array Tipinde Olmalıdır!",
            'floors.*.lot_groups.*.lots.required'    => "Lütfen Park Alan Bilgilerini Giriniz!",

            'floors.*.lot_groups.*.lots.*.lot_name.required'    => "Lütfen Park Alanı Adını Giriniz!",
            'floors.*.lot_groups.*.lots.*.lot_name.string'    => "Geçersiz Park Alanı Adı!",
            'floors.*.lot_groups.*.lots.*.x1.required' => 'Lot x1 koordinatını giriniz',
            'floors.*.lot_groups.*.lots.*.x1.numeric' => 'Geçersiz x1 koordinatı',
            
            'floors.*.lot_groups.*.lots.*.x2.required' => 'Lot x2 koordinatını giriniz',
            'floors.*.lot_groups.*.lots.*.x2.numeric' => 'Geçersiz x2 koordinatı',

            'floors.*.lot_groups.*.lots.*.y1.required' => 'Lot y1 koordinatını giriniz',
            'floors.*.lot_groups.*.lots.*.y1.numeric' => 'Geçersiz y1 koordinatı',

            'floors.*.lot_groups.*.lots.*.y2.required' => 'Lot y2 koordinatını giriniz',
            'floors.*.lot_groups.*.lots.*.y2.numeric' => 'Geçersiz y2 koordinatı',
        ];
    }
}