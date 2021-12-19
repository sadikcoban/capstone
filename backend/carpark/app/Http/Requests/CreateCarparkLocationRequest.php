<?php

namespace App\Http\Requests;

class CreateCarparkLocationRequest extends FormRequest
{
    public  function rules()
    {
        return [
            'owner_id' => 'required|numeric|exists:owners,id',
            'address'  => 'required',
            'capacity' => 'integer|required',
            'start_hour' => 'integer|between:1,24|required',
            'end_hour'  => 'integer|between:1,24|required',
            'lat'   => 'required|string',
            'lon'       => 'required|string',
            "explanation" => "required",
            'city_id'  => 'required|integer|between:1,81',
            
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
            "explanation.required" => "Lütfen Park Alanınıza Dair Açıklama Bilgisi Giriniz",
            'city_id.required'  => 'Şehir Kodu Seçiniz',
            'city_id.integer'  => 'Geçersiz Şehir Kodu',
            'city_id.between'  => 'Geçersiz Şehir Kodu',

          ];
    }
}