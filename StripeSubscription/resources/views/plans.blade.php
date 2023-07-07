@extends('layouts.app')

@section('content')
<div class="container">
<section>
  <div class="container py-5">

  <header class="text-center mb-5 text-white">
      <div class="row">
        <div class="col-lg-12 mx-auto">
          <h1>Laravel 9 Cashier Stripe Subscription</h1>
          <h3>PRICING</h3>
        </div>
      </div>
    </header>

    <div class="row text-center align-items-end">

        {{-- @foreach($plans as $plan) --}}
        <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="bg-white p-5 rounded-lg shadow">
            <h1 class="h6 text-uppercase font-weight-bold mb-4">{{ $plans[0]->name }}</h1>
            <h2 class="h1 font-weight-bold">₹{{ $plans[0]->price }}<span class="text-small font-weight-normal ml-2">/ month</span></h2>

            <div class="custom-separator my-4 mx-auto bg-primary"></div>

            <ul class="list-unstyled my-5 text-small text-left font-weight-normal">
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Lorem ipsum dolor sit amet</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Sed ut perspiciatis</li>
                <li class="mb-3">
                <i class="fa fa-times mr-2"></i><del><i> At vero eos et accusamus</i></del></li>
                <li class="mb-3">
                <i class="fa fa-times mr-2"></i> <del><i>Nam libero tempore</i></del></li>
                <li class="mb-3">
                <i class="fa fa-times mr-2"></i> <del><i>Sed ut perspiciatis</i></del></li>
                <li class="mb-3 text-muted">
                <i class="fa fa-times mr-2"></i>
                <del><i>Sed ut perspiciatis</i></del>
                </li>
            </ul>
            <a href="{{ route('plans.show', $plans[0]->slug) }}" class="btn btn-primary btn-block shadow rounded-pill">Buy Now</a>
            </div>
        </div>
        {{-- @endforeach --}}
        <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="bg-white p-5 rounded-lg shadow">
            <h1 class="h6 text-uppercase font-weight-bold mb-4">{{ $plans[1]->name }}</h1>
            <h2 class="h1 font-weight-bold">₹{{ $plans[1]->price }}<span class="text-small font-weight-normal ml-2">/ month</span></h2>

            <div class="custom-separator my-4 mx-auto bg-primary"></div>

            <ul class="list-unstyled my-5 text-small text-left font-weight-normal">
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Lorem ipsum dolor sit amet</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Sed ut perspiciatis</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> At vero eos et accusamus</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Nam libero tempore</li>
                <li class="mb-3">
                <i class="fa fa-times mr-2 "></i> <del><i>Sed ut perspiciatis</i></del></li>
                <li class="mb-3 text-muted">
                <i class="fa fa-times mr-2"></i>
                <del><i>Sed ut perspiciatis</i></del>
                </li>
            </ul>
            <a href="{{ route('plans.show', $plans[1]->slug) }}" class="btn btn-primary btn-block shadow rounded-pill">Buy Now</a>
            </div>
        </div>


        <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="bg-white p-5 rounded-lg shadow">
            <h1 class="h6 text-uppercase font-weight-bold mb-4">{{ $plans[2]->name }}</h1>
            <h2 class="h1 font-weight-bold">₹{{ $plans[2]->price }}<span class="text-small font-weight-normal ml-2">/ month</span></h2>

            <div class="custom-separator my-4 mx-auto bg-primary"></div>

            <ul class="list-unstyled my-5 text-small text-left font-weight-normal">
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Lorem ipsum dolor sit amet</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Sed ut perspiciatis</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> At vero eos et accusamus</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Nam libero tempore</li>
                <li class="mb-3">
                <i class="fa fa-check mr-2 text-primary"></i> Sed ut perspiciatis</li>
                <li class="mb-3 text-muted">
                <i class="fa fa-check mr-2 text-primary"></i>
                <i>Sed ut perspiciatis</i>
                </li>
            </ul>
            <a href="{{ route('plans.show', $plans[2]->slug) }}" class="btn btn-primary btn-block shadow rounded-pill">Buy Now</a>
            </div>
        </div>
    </div>
  </div>
</section>

</div>
@endsection
