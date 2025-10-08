<?php

namespace App\Services\User;

use App\Models\Company;
use App\Models\User;
use App\Repositories\User\Contracts\UserRepositoryInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Exception;

class UserService
{
    protected UserRepositoryInterface $userRepository;

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Get all users with filters and pagination
     */
    public function getAllUsers(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        return $this->userRepository->getAllWithFilters($filters, $perPage);
    }

    /**
     * Get user by ID
     */
    public function getUserById(int $id): ?User
    {
        return $this->userRepository->findById($id);
    }

    /**
     * Create a new user
     *
     * @throws Exception
     */
    public function createUser(array $data): User
    {
        try {
            DB::beginTransaction();

            // company'yi bul veya oluştur
            $company = Company::firstOrCreate(
                ['name' => $data['company_name']],
                ['name' => $data['company_name']]
            );

            $userData = [
                'company_id' => $company->id,
                'first_name' => $data['first_name'],
                'last_name' => $data['last_name'],
                'email' => $data['email'],
                'phone' => $data['phone'],
            ];

            $user = $this->userRepository->create($userData);

            DB::commit();

            return $user->load('company');
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception('User oluşturulurken hata oluştu: ' . $e->getMessage());
        }
    }

    /**
     * Update user
     *
     * @throws Exception
     */
    public function updateUser(int $id, array $data): User
    {
        try {
            DB::beginTransaction();

            $user = $this->userRepository->findById($id);

            if (!$user) {
                throw new Exception('Kullanıcı bulunamadı.');
            }

            // Eğer company_name verilmişse, company'yi güncelle veya oluştur
            if (isset($data['company_name'])) {
                $company = Company::firstOrCreate(
                    ['name' => $data['company_name']],
                    ['name' => $data['company_name']]
                );
                $data['company_id'] = $company->id;
                unset($data['company_name']);
            }

            $this->userRepository->update($id, $data);

            DB::commit();

            return $this->userRepository->findById($id);
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception('User güncellenirken hata oluştu: ' . $e->getMessage());
        }
    }

    /**
     * Delete user (soft delete)
     *
     * @throws Exception
     */
    public function deleteUser(int $id): bool
    {
        $user = $this->userRepository->findById($id);

        if (!$user) {
            throw new Exception('Kullanıcı bulunamadı.');
        }

        return $this->userRepository->delete($id);
    }

    /**
     * Restore soft deleted user
     *
     * @throws Exception
     */
    public function restoreUser(int $id): User
    {
        $user = $this->userRepository->findTrashedById($id);

        if (!$user) {
            throw new Exception('Silinmiş kullanıcı bulunamadı.');
        }

        $restored = $this->userRepository->restore($id);

        if (!$restored) {
            throw new Exception('Kullanıcı geri yüklenemedi.');
        }

        return $this->userRepository->findById($id);
    }
}
