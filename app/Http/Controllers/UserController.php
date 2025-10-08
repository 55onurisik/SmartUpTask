<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Services\User\UserService;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserController extends Controller
{
    use ApiResponse;

    protected UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * Display a listing of the users with optional filters
     */
    public function index(Request $request): JsonResponse
    {
        try {
            $filters = $request->only([
                'company_id',
                'company_name',
                'email',
                'phone',
                'first_name',
                'last_name'
            ]);

            $perPage = $request->input('per_page', 15);
            $users = $this->userService->getAllUsers($filters, $perPage);

            return $this->paginated($users);
        } catch (Exception $e) {
            return $this->error('Kullanıcılar listelenirken hata oluştu.', $e->getMessage());
        }
    }

    /**
     * Store a newly created user in storage
     */
    public function store(StoreUserRequest $request): JsonResponse
    {
        try {
            $user = $this->userService->createUser($request->validated());

            return $this->created($user, 'Kullanıcı başarıyla oluşturuldu.');
        } catch (Exception $e) {
            return $this->error('Kullanıcı oluşturulurken hata oluştu.', $e->getMessage());
        }
    }

    /**
     * Display the specified user
     */
    public function show(int $id): JsonResponse
    {
        try {
            $user = $this->userService->getUserById($id);

            if (!$user) {
                return $this->notFound('Kullanıcı bulunamadı.');
            }

            return $this->success($user);
        } catch (Exception $e) {
            return $this->error('Kullanıcı getirilirken hata oluştu.', $e->getMessage());
        }
    }

    /**
     * Update the specified user in storage
     */
    public function update(UpdateUserRequest $request, int $id): JsonResponse
    {
        try {
            $user = $this->userService->updateUser($id, $request->validated());

            return $this->success($user, 'Kullanıcı başarıyla güncellendi.');
        } catch (Exception $e) {
            return $this->error('Kullanıcı güncellenirken hata oluştu.', $e->getMessage());
        }
    }

    /**
     * Remove the specified user from storage (soft delete)
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            $this->userService->deleteUser($id);

            return $this->success(null, 'Kullanıcı başarıyla silindi.');
        } catch (Exception $e) {
            return $this->error('Kullanıcı silinirken hata oluştu.', $e->getMessage());
        }
    }

    /**
     * Restore soft deleted user
     */
    public function restore(int $id): JsonResponse
    {
        try {
            $user = $this->userService->restoreUser($id);

            return $this->success($user, 'Kullanıcı başarıyla geri yüklendi.');
        } catch (Exception $e) {
            return $this->error('Kullanıcı geri yüklenirken hata oluştu.', $e->getMessage());
        }
    }
}
