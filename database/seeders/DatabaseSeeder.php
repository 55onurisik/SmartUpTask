<?php

namespace Database\Seeders;

use App\Models\Company;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        Company::factory(10)->create()->each(function ($company) {
            User::factory(rand(3, 7))
                ->turkish()
                ->create([
                    'company_id' => $company->id
                ]);
        });

        $this->command->info(Company::count() . ' firma oluşturuldu!');
        $this->command->info(User::count() . ' kullanıcı oluşturuldu!');
    }
}
