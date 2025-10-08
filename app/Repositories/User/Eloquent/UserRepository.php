<?php

namespace App\Repositories\User\Eloquent;

use App\Models\User;
use App\Repositories\User\Contracts\UserRepositoryInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;

class   UserRepository implements UserRepositoryInterface
{
    protected User $model;

    public function __construct(User $model)
    {
        $this->model = $model;
    }

    /**
     * Get all users with pagination and optional filters
     */
    public function getAllWithFilters(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        $query = $this->model->with('company');

        // Filter by company_id
        if (!empty($filters['company_id'])) {
            $query->where('company_id', $filters['company_id']);
        }

        // Filter by email
        if (!empty($filters['email'])) {
            $query->where('email', 'like', '%' . $filters['email'] . '%');
        }

        // Filter by phone
        if (!empty($filters['phone'])) {
            $query->where('phone', 'like', '%' . $filters['phone'] . '%');
        }

        // Filter by first_name
        if (!empty($filters['first_name'])) {
            $query->where('first_name', 'like', '%' . $filters['first_name'] . '%');
        }

        // Filter by last_name
        if (!empty($filters['last_name'])) {
            $query->where('last_name', 'like', '%' . $filters['last_name'] . '%');
        }

        // Filter by company name (via relationship)
        if (!empty($filters['company_name'])) {
            $query->whereHas('company', function ($q) use ($filters) {
                $q->where('name', 'like', '%' . $filters['company_name'] . '%');
            });
        }

        return $query->latest()->paginate($perPage);
    }

    /**
     * Find user by ID
     */
    public function findById(int $id): ?User
    {
        return $this->model->with('company')->find($id);
    }

    /**
     * Create a new user
     */
    public function create(array $data): User
    {
        return $this->model->create($data);
    }

    /**
     * Update user
     */
    public function update(int $id, array $data): bool
    {
        $user = $this->model->find($id);

        if (!$user) {
            return false;
        }

        return $user->update($data);
    }

    /**
     * Soft delete user
     */
    public function delete(int $id): bool
    {
        $user = $this->model->find($id);

        if (!$user) {
            return false;
        }

        return $user->delete();
    }

    /**
     * Find user by email
     */
    public function findByEmail(string $email): ?User
    {
        return $this->model->where('email', $email)->first();
    }

    /**
     * Find soft deleted user by ID
     */
    public function findTrashedById(int $id): ?User
    {
        return $this->model->onlyTrashed()->with('company')->find($id);
    }

    /**
     * Restore soft deleted user
     */
    public function restore(int $id): bool
    {
        $user = $this->model->onlyTrashed()->find($id);

        if (!$user) {
            return false;
        }

        return $user->restore();
    }
}
