<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'company_id' => null, // Will be set when creating
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            'email' => fake()->unique()->safeEmail(),
            'phone' => '0555' . fake()->unique()->numerify('#######'),
        ];
    }

    /**
     * Configure the factory to use Turkish locale
     */
    public function turkish(): static
    {
        return $this->state(fn (array $attributes) => [
            'first_name' => fake('tr_TR')->firstName(),
            'last_name' => fake('tr_TR')->lastName(),
        ]);
    }
}
