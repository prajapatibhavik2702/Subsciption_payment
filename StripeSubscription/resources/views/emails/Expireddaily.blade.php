@component('mail::message')

Website Name : <b>Subscription Expired </b>
<br><br>
Hello <b></b>,

 Your Subscription has been Expired  THANK YOU. From now on, you can surf our website to explore a lot of interesting things with your account information as below.

<br>
Name :  {{ $name }}<br>
Email : {{ $email }}<br>
Amount :    {{ $amount }}<br>
BuY_date :  {{ $buy_date }}<br>
Expired-date : {{ $ex_date }}<br>


@component('mail::button', ['url' => route('myplan')])
 Your Subscription Has Expired
@endcomponent

Thanks,<br>
<b></b>
@endcomponent
