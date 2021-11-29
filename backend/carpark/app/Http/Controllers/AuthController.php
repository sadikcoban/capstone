<?php

namespace App\Http\Controllers;

use App\Http\Requests\ForgotPasswordRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\CreateTokenRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\ResendVerificationRequest;
use App\Http\Requests\UpdatePasswordRequest;
use App\Models\User;
use Firebase\JWT\JWT;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{

    public function login(LoginRequest $request)
    {
        $email = $request->email;
        $password = $request->password;

        $user = User::query()->where("email", $email)->first();

        if (empty($user)) {
            return failure_response([
                "Email Adresi veya Şifre Hatalı Girildi."
            ]);
        }

        if ($user->is_email_verified == 0) {
            return failure_response([
                "Email Adresiniz Henüz Onaylanmadı. Lütfen E-postanıza iletilen onaylama linkine tıklayınız",
            ], 419);
        }

        $passwd_check = Hash::check($password, $user->password);

        if (!$passwd_check) {
            return failure_response([
                "Email Adresi veya Şifre Hatalı Girildi."
            ]);
        }

        // here you know data is valid
        $user_name = $user->name ?? "";
        $user_surname = $user->surname ?? "";
        $user_short_name  = "";
        if ($user_name != "" && $user_surname != "") {
            $user_short_name = $user_name[0] . $user_surname[0];
        }
        $token = $this->getToken([
            "user_id" => $user->id,
            "email" => $user->email,
            "name" => $user_name,
            "surname" => $user_surname,
            "short_name" => $user_short_name,
            "should_update_password" => $user->should_update_password

        ]);

        if ($token['status'] == false) {
            return failure_response([
                [$token['message']]
            ], 401);
        }

        if (
            !$user->update([
                'refresh_token' => $token['data']['refresh_token'],
            ])
        ) {
            return failure_response(["Giriş yaparken hata oluştu."]);
        }

        return success_response($token["data"]);
    }

    private function getToken($payload)
    {
        $access_token_secret_key = config('app.jwt.access_token_secret_key');
        $refresh_token_secret_key = config('app.jwt.refresh_token_secret_key');

        $time = time();
        $exp = (24 * 60 * 60);

        $token = [
            'user' => $payload,
            'iat' => $time,
            'exp' => $time + $exp,
        ];

        $access_token = JWT::encode($token, $access_token_secret_key);

        $token['exp'] = $time + (24 * 60 * 60 * 60); // 2 ay
        $refresh_token = JWT::encode($token, $refresh_token_secret_key);


        // @TODO refresh token set user table

        $data = [
            'access_token' => $access_token,
            'refresh_token' => $refresh_token,
            'expires_in' => $exp
        ];

        return [
            'status' => true,
            'data' => $data
        ];
    }

    public function createToken(CreateTokenRequest $request)
    {
        //TODO: CATCH ERRORS WHEN DECODING TOKEN
        $user = User::query()->where('email', $request->user_detail->email)->first();
        $user_check = User::query()
            ->where("id", $user->id)
            ->where("refresh_token", $request->refresh_token)
            ->first();

        if (!$user_check) {
            return failure_response(["Geçersiz veri"]);
        }
        $access_token_secret_key = config('app.jwt.access_token_secret_key');
        $refresh_token_secret_key = config('app.jwt.refresh_token_secret_key');



        $decoded = JWT::decode($user_check->refresh_token, $refresh_token_secret_key, array('HS256'));

        $data = (array) $decoded;
        $expiration =
            (array)$data['exp'];
        if ($expiration < time()) {
            return failure_response(["Lütfen tekrar giriş yapınız"], 403);
        }

        $time = time();
        $exp = (24 * 60 * 60);

        $user_name = $user->name ?? "";
        $user_surname = $user->surname ?? "";
        $user_short_name  = "";
        if ($user_name != "" && $user_surname != "") {
            $user_short_name = $user_name[0] . $user_surname[0];
        }
        $payload = [
            "user_id" => $user->id,
            "email" => $user->email,
            "name" => $user_name,
            "surname" => $user_surname,
            "short_name" => $user_short_name,
            "should_update_password" => $user->should_update_password

        ];

        $token = [
            'user' => $payload,
            'iat' => $time,
            'exp' => $time + $exp,
        ];

        $new_access_token = JWT::encode($token, $access_token_secret_key);
        return success_response(["access_token" => $new_access_token]);
    }

    public function register(RegisterRequest $request)
    {
        $email = $request->email;
        $password = $request->password;
        $password = app('hash')->make($password);

        $user = new User();
        $random_token  = sha1(time());
        $user->email = $email;
        $user->password = $password;
        $user->email_verification_token = $random_token;

        if (!$user->save()) {
            return failure_response(["Kullanıcı kayıt edilirken hata oluştu."]);
        }

        send_verification_mail($email, $random_token);

        return success_response([
            "message" => "Kayıt eklendi. Lütfen e-postanıza giderek hesabınızı aktifleştirin."
        ]);
    }

    public function verifyEmail($token)
    {
        $user = User::query()->where("email_verification_token", $token)->first();


        if (isset($user)) {
            if (!$user->is_email_verified) {
                //verify email
                $user->is_email_verified = 1;
                if (!$user->save()) {
                    $status = "Kullanıcı kayıt edilirken hata oluştu.";
                } else {
                    $status = "Email adresi başarılı bir şekilde onaylandı. Uygulamaya giriş yapabilirsiniz";
                }
            } else {
                //email is already verified
                $status = "Email adresi zaten onaylı";
            }
        } else {
            //email can not be verified
            $status = "Tanımlanmamış email adresi";
        }

        return view("emails.email_verification_result", ["status" => $status]);
    }

    public function resendVerificationMail(ResendVerificationRequest $request)
    {
        $email = $request->email;
        $user = User::query()->where("email", $email)->first();
        if (empty($user)) {
            return failure_response(["Kullanıcı bulunamadı."]);
        }
        if (
            isset($user->is_email_verified) &&
            ($user->is_email_verified)
        ) {
            return failure_response(["Email adresi daha önce onaylanmıştır"]);
        }
        $random_token  = sha1(time());
        $user->is_email_verified = 0;
        $user->email_verification_token = $random_token;

        if (!$user->save()) {
            return failure_response(["Bir Hata Oluştu. Lütfen Tekrar Deneyiniz"]);
        }

        send_verification_mail($email, $random_token);

        return success_response([
            "message" => "Verifikasyon linki başarıyla gönderildi"
        ]);
    }

    public function forgotPassword(ForgotPasswordRequest $request)
    {
        $user = User::query()->where('email', $request->email)->first();

        //generate a temporary password of length 8 which satisfies the conditions
        $digits    = array_flip(range('0', '9'));
        $lowercase = array_flip(range('a', 'z'));
        $uppercase = array_flip(range('A', 'Z'));
        $special   = array_flip(str_split('@$!%?&.,:;'));
        $combined  = array_merge($digits, $lowercase, $uppercase, $special);

        $temp_password  = str_shuffle(array_rand($digits) .
            array_rand($lowercase) .
            array_rand($uppercase) .
            array_rand($special) .
            implode(array_rand($combined, 4)));

        $temp_password_hashed = app('hash')->make($temp_password);

        $user->password = $temp_password_hashed;
        $user->should_update_password = 1;

        if (!$user->save()) {
            return failure_response(["Bir Hata Oluştu. Lütfen Tekrar Deneyiniz"]);
        }
        send_forgot_password_mail($user->email, $temp_password);

        return success_response(["message" => "Geçici şifreniz email adresinize gönderildi. Lütfen sisteme tekrar giriş yapın"]);
    }

    public function updatePassword(UpdatePasswordRequest $request)
    {
        $user = User::query()->where('email', $request->user_detail->email)->first();
        $prev_password = $request->prev_password;

        $prev_passwd_check = Hash::check($prev_password, $user->password);

        if (!$prev_passwd_check) {
            return failure_response([
                "Eski Şifre Hatalı Girildi."
            ]);
        }

        if (($request->new_password == $request->prev_password)) {
            return failure_response([
                "Yeni şifre önceki şifreden farklı olmalıdır!"
            ]);
        }

        $new_password = app('hash')->make($request->new_password);




        $user->password = $new_password;


        $user->should_update_password = 0;


        if (!$user->save()) {
            return failure_response(["Hata oluştu. Lütfen tekrar deneyiniz"]);
        }

        return success_response([
            "message" => "Şifre başarıyla güncellendi"
        ]);
    }

    public function logout()
    {
        return success_response(["message" => "Başarılı"]);
    }
}