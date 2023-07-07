<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use App\Mail\DailyEmail;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Models\Plan;
use Illuminate\Support\Facades\Auth;

class SendDailyEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:send-daily-email';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
    $newDate = Carbon::now()->addDays(2)->format('d-m-Y');
    $users = DB::table('users')->get();

    foreach ($users as $user) {
        $subscriptions = DB::table('subscriptions')
            ->select('created_at','stripe_price')
            ->where('user_id', $user->id)
            ->get();

        foreach ($subscriptions as $subscription) {
            $createdAt = Carbon::createFromFormat('Y-m-d H:i:s', $subscription->created_at)
                ->addDays(30)
                ->format('d-m-Y');

                $buy_date = Carbon::createFromFormat('Y-m-d H:i:s', $subscription->created_at)
                ->format('d-m-Y');
                // dump($createdAt);
                // dd($subscription);
                $plan = Plan::where('stripe_plan', $subscription->stripe_price)->first();

                    if ($createdAt === $newDate) {
                        // dd('jjhsfgdhfjg');
                        // $data = Auth::user();
                        $maildata=['name'=>$user->name ,'email'=>$user->email ,'amount'=>$plan->price ,'buy_date'=>$buy_date,'ex_date'=>$createdAt];

                        Mail::to($user->email)->send(new DailyEmail($maildata));

                    }
        }
    }
}
}
