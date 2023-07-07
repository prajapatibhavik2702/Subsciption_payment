<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class TicketbookController extends Mailable
{
    use Queueable, SerializesModels;
    public  $maildata;
    /**
     * Create a new message instance.
     */
    public function __construct($maildata)
    {
        // dd($this->maildata);
        $this->maildata=$maildata;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(

            subject: 'SubScription Payments',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'emails.orders.ticketbook',


            with:[
                'name'=>$this->maildata['name'],
                'email'=>$this->maildata['email'],
                'id'=>$this->maildata['id'],
                'amount'=>$this->maildata['amount'],
                'buy_date'=>$this->maildata['buy_date'],
                'ex_date'=>$this->maildata['ex_date'],
            ],
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
