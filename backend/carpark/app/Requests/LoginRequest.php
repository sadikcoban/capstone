<?php

namespace App\Http\Requests;

class LoginRequest extends FormRequest
{
    public  function rules()
    {
        return [
            'email'    => 'required|email',
            'password' => 'required|min:3',
        ];
    }

    public  function messages()
    {
        return [
            'email.required'    => "Lütfen Email Alanını Giriniz!",
            'email.email'       => "Lütfen Email Alanını Doğru Formatta Giriniz!",
            'password.required' => "Lütfen Şifre Alanını Giriniz!",
        ];
    }
}