<?php

namespace App\Http\Requests;

class UpdateLotRequest extends FormRequest
{
    public  function rules()
    {
        return [
            'id'    => 'required',
            'status' => 'required|',
            'wrong_plate' => 'required'
        ];
    }

    public  function messages()
    {
        return [
            'id.required'    => "ID Alanını Giriniz!",
            'status.required'    => "status Alanını Giriniz!",
            'wrong_plate.required'    => "wrong_plate Alanını Giriniz!",
         ];
    }
}