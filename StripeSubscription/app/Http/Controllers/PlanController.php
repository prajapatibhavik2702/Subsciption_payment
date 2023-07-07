<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Plan;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Jobs\TicketBookEmail;
use Nette\Utils\DateTime;
use DateInterval;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Stripe\Subscription;
use Illuminate\Support\Facades\DB;

use App\Mail\DailyEmail;


class PlanController extends Controller
{
    public function index()
    {
        $plans = Plan::get();

        return view("plans",compact('plans'));
    }

    public function myindex()
    {
       $userId = Auth::id();

       $subscriptions = DB::table('subscriptions')
       ->join('plans', 'subscriptions.stripe_price', '=', 'plans.stripe_plan')
       ->where('subscriptions.user_id', $userId)
       ->get();

       $plan_date = DB::table('subscriptions')->where('user_id', $userId)->get('created_at');

        $date= Carbon::parse($plan_date[0]->created_at)->format('d-m-Y');

        $expiredDate = Carbon::parse($date)->addMonth()->format('d-m-Y');


        return view('myplan',compact('subscriptions','date','expiredDate'));

    }
    public function show(Plan $plan, Request $request)
    {
        $intent = auth()->user()->createSetupIntent();

        return view("subscription", compact("plan", "intent"));
    }

    public function subscription(Request $request)
    {
        $plan = Plan::find($request->plan);
        // dd($request->token);
        $subscription = $request->user()->newSubscription($request->plan, $plan->stripe_plan)
                        ->create($request->token);
        // dd($subscription);
                        $currentDate = Carbon::now()->format('d-m-Y');
                    //    dd($currentDate);

                        $date = strtotime("+30 days");
                        $ex_date =  (date("d-m-Y", $date));


          //sendmail -> user add (admin)
          $maildata=['name'=>auth()->user()->name , 'email'=>auth()->user()->email, 'id'=>auth()->user()->id ,'amount'=>$plan->price ,'buy_date'=>$currentDate,'ex_date'=>$ex_date];

        //   dd($maildata);
          TicketBookEmail::dispatch($maildata);

        return redirect('/myplans');
    }




}
