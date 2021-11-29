<?php
namespace App\Http\Middleware;

use Closure;

class StaticTokenMiddleware
{
    public function handle($request, Closure $next)
    {
        $app_static_token = config("app.static_token");

        $token = $request->header('Token');

        if ( !isset($token) || empty($token) ) {
            return failure_response(["Unauthorized-1"], 401);
        }

        if ( $token != $app_static_token ) {
            return failure_response(["Unauthorized-2"], 401);
        }

        return $next($request);
    }
}