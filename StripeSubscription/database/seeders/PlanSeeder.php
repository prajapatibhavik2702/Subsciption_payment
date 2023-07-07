<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Plan;

class PlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $plans = [
            [
                'name' => 'Free plan',
                'slug' => 'free',
                'stripe_plan' => 'price_1NPkgwGHl4KbN4XugIp7YZOc',
                'price' => 0,
                'description' => 'Business Plan'
            ],
            [
                'name' => 'Business Plan',
                'slug' => 'business-plan',
                'stripe_plan' => 'price_1NPjdVGHl4KbN4Xu7qu11aaT',
                'price' => 299,
                'description' => 'Business Plan'
            ],
            [
                'name' => 'Premium',
                'slug' => 'premium',
                'stripe_plan' => 'price_1NPjepGHl4KbN4XuPCUuDeRK',
                'price' => 999,
                'description' => 'Premium'
            ]
        ];
        foreach ($plans as $plan) {
            Plan::create($plan);
        }
    }
}
