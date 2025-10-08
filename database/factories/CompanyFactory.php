<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Company>
 */
class CompanyFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $companyTypes = ['Teknoloji', 'Yazılım', 'Solutions', 'Innovations', 'Systems', 'Services', 'Group', 'Corp', 'Inc', 'Ltd'];
        $companyPrefixes = ['Smart', 'Digital', 'Tech', 'Cloud', 'Web', 'Mobile', 'Data', 'Cyber', 'Soft', 'Net', 'Pro', 'Ultra', 'Mega', 'Global'];

        return [
            'name' => fake()->company() . ' ' . fake()->randomElement($companyTypes),
        ];
    }
}
