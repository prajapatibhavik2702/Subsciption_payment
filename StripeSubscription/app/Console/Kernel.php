<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Console\Commands\SendDailyEmail;
use App\Console\Commands\ExpiredDailyEmail;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     */
    protected $commands=[
        Commands\SendDailyEmail::class,
        Commands\ExpiredDailyEmail::class,
    ];

    protected function schedule(Schedule $schedule): void
    {
        // $schedule->command('inspire')->hourly();
        $schedule->command('app:send-daily-email')->cron('* * * * *');
        $schedule->command('app:send-expired')->cron('* * * * *');
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
