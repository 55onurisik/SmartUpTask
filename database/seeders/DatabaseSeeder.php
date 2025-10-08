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
        // 10 firma oluştur
        Company::factory(10)->create()->each(function ($company) {
            // Her firma için 3-7 arası kullanıcı oluştur
            User::factory(rand(3, 7))
                ->turkish() // Türkçe isimler
                ->create([
                    'company_id' => $company->id
                ]);
        });

        $this->command->info(Company::count() . ' firma oluşturuldu!');
        $this->command->info(User::count() . ' kullanıcı oluşturuldu!');
    }
}
