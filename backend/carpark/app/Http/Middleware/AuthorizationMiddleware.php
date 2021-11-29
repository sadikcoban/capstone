<?php

namespace App\Http\Middleware;

use App\Models\Kullanici\Kullanici;
use App\Models\MobilApp\KullaniciOturumLog;
use App\Models\User;
use Closure;
use \Firebase\JWT\JWT;
use Illuminate\Support\Facades\Route;

class AuthorizationMiddleware
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //TODO: HANDLE ERRORS MORE INTUITIVELY

        $access_token = $request->header('Authorization');

        if (empty($access_token)) {
            return failure_response(["Unauthorized-2"], 401);
        }


        try {
            $secret_key = config('app.jwt.access_token_secret_key');
            $decoded = JWT::decode($access_token, $secret_key, array('HS256'));
            $data = (array) $decoded;

            //check whether token is expired or not
            $expiration = (array)$data['exp'];
            if ($expiration < time()) {
                return failure_response(["Expired token"], 401);
            }

            $user_data = (array)$data['user'];
            $user = User::query()->where('email', $user_data['email'])->first();
            if ($user->access_token != $access_token) {
                if (empty($access_token)) {
                    return failure_response(["Unauthorized-2"], 401);
                }
            }

            $params = $request->all();
            $params["user_detail"] = $user;
            $request->replace($params);

            return $next($request);
        } catch (\Exception $exception) {
            return failure_response(["Unauthorized-5 " . $exception->getMessage()], 401);
        }
    }

}