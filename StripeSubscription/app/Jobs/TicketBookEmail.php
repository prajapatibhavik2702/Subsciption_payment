<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Mail\TicketbookController;
class TicketBookEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    public $maildata;

    /**
     * Create a new job instance.
     */
    public function __construct($maildata)
    {
        // dd($this->maildata);
        $this->maildata=$maildata;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {

        Mail::to($this->maildata['email'])->send(new TicketbookController($this->maildata));
    }
}
