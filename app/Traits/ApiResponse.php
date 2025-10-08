<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait   ApiResponse
{
    /**
     * Success response
     */
    protected function success($data = null, string $message = null, int $code = 200): JsonResponse
    {
        $response = [
            'success' => true,
        ];

        if ($message) {
            $response['message'] = $message;
        }

        if ($data !== null) {
            $response['data'] = $data;
        }

        return response()->json($response, $code);
    }

    /**
     * Created response
     */
    protected function created($data = null, string $message = 'Kayıt başarıyla oluşturuldu.'): JsonResponse
    {
        return $this->success($data, $message, 201);
    }

    /**
     * Error response
     */
    protected function error(string $message, $errors = null, int $code = 500): JsonResponse
    {
        $response = [
            'success' => false,
            'message' => $message,
        ];

        if ($errors !== null) {
            $response['error'] = $errors;
        }

        return response()->json($response, $code);
    }

    /**
     * Not found response
     */
    protected function notFound(string $message = 'Kayıt bulunamadı.'): JsonResponse
    {
        return $this->error($message, null, 404);
    }

    /**
     * Validation error response
     */
    protected function validationError($errors, string $message = 'Validation errors'): JsonResponse
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'errors' => $errors
        ], 422);
    }

    /**
     * Paginated response
     */
    protected function paginated($paginator, string $message = null): JsonResponse
    {
        $response = [
            'success' => true,
        ];

        if ($message) {
            $response['message'] = $message;
        }

        $response['data'] = $paginator->items();
        $response['pagination'] = [
            'current_page' => $paginator->currentPage(),
            'last_page' => $paginator->lastPage(),
            'per_page' => $paginator->perPage(),
            'total' => $paginator->total(),
            'from' => $paginator->firstItem(),
            'to' => $paginator->lastItem(),
        ];

        return response()->json($response, 200);
    }
}
