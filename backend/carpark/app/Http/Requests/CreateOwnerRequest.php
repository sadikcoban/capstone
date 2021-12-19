<?php

namespace App\Http\Requests;

class CreateOwnerRequest extends FormRequest
{
    public  function rules()
    {
        return [
            'name'    => 'required|string',
            'surname' => 'required|string',
            'company' => 'required|string',
            'phone'   => 'required|string|size:10',
            'iban'    => 'required|string',
            'address'    => 'required|string',
            'mail'    => 'required|string',
            'password'   => 'required|min:6'
        ];
    }

    public  function messages()
    {
        return [
            'mail.required'    => "Lütfen Email Alanını Giriniz!",
            'mail.email'       => "Lütfen Email Alanını Doğru Formatta Giriniz!",
            'password.required' => "Lütfen Şifre Alanını Giriniz!",
            'password.min' => "Şifre Minimum 6 Karakter Olmalı!",
            'address.required'    => "Lütfen Adres Alanını Giriniz!",
            'address.string'    => "Geçersiz Adres!",
            'iban.required'    => "Lütfen IBAN Alanını Giriniz!",
            'iban.string'    => "Geçersiz IBAN!",
            'company.required'    => "Lütfen Şirket Alanını Giriniz!",
            'company.string'    => "Geçersiz Şirket Bilgisi!",
            'name.required'    => "Lütfen İsim Alanını Giriniz!",
            'name.string'    => "Geçersiz İsim!",
            'surname.required'    => "Lütfen Soyisim Alanını Giriniz!",
            'iban.string'    => "Geçersiz Soyisim!",
            'phone.required'    => "Lütfen Telefon Numaraso Alanını Giriniz!",
            'phone.string'    => "Geçersiz Telefon Numarası!",
            'phone.size'    => "Telefon Numarası 10 Karakter Olmalı!",
         ];
    }
}