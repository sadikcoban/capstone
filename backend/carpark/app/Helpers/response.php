<?php


/**
 * @param array $data
 * @param int $status
 * @param array $headers
 * @return \Illuminate\Http\Response|\Laravel\Lumen\Http\ResponseFactory
 */
function success_response($data = [], $headers = [], $status = 200)
{
    $payload = json_encode([
        'status'     => true,
        'data'       => $data,
        'errors'     => []
    ]);

    if (!isset($headers["Content-Type"])) {
        $headers["Content-Type"] = "application/json; charset=utf-8";
    }

    return response($payload, $status, $headers);
}

/**
 * @param array $errors
 * @param int $status
 * @param array $headers
 * @return \Illuminate\Http\Response|\Laravel\Lumen\Http\ResponseFactory
 */
function failure_response($errors = [], $status = 400, $headers = [])
{
    $payload = json_encode([
        'status' => false,
        'data'   => [],
        'errors' => $errors
    ]);

    if (!isset($headers["Content-Type"])) {
        $headers["Content-Type"] = "application/json; charset=utf-8";
    }

    return response($payload, $status, $headers);
}