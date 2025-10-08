<?php

namespace App\Repositories\User\Contracts;

use App\Models\User;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;

interface UserRepositoryInterface
{
    /**
     * Get all users with pagination and optional filters
     */
    public function getAllWithFilters(array $filters = [], int $perPage = 15): LengthAwarePaginator;

    /**
     * Find user by ID
     */
    public function findById(int $id): ?User;

    /**
     * Create a new user
     */
    public function create(array $data): User;

    /**
     * Update user
     */
    public function update(int $id, array $data): bool;

    /**
     * Soft delete user
     */
    public function delete(int $id): bool;

    /**
     * Find user by email
     */
    public function findByEmail(string $email): ?User;

    /**
     * Find soft deleted user by ID
     */
    public function findTrashedById(int $id): ?User;

    /**
     * Restore soft deleted user
     */
    public function restore(int $id): bool;
}
