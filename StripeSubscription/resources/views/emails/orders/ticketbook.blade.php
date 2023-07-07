@component('mail::message')

Website Name : <b>Subscription System</b>
<br><br>
Hello <b>{{ $name }}</b>,

Congratulations!  Your Subscription has been succefully booked  THANK YOU. From now on, you can surf our website to explore a lot of interesting things with your account information as below.

<br>
Name : <b>{{ $name }}</b><br>
Email : <b>{{ $email }}</b> <br>
Amount : <b>{{ $amount }}</b><br>
BuY_date : <b>{{ $buy_date }}</b><br>
Expired-date : <b>{{ $ex_date }}</b>


@component('mail::button', ['url' => ""])
Show Your Subscription
@endcomponent

Thanks,<br>
<b>{{ config('app.name') }}</b>
@endcomponent
