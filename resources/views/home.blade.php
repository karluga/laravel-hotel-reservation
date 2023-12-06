@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            @auth
            <div class="card">
                <div class="card-header">{{ __('Homepage') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
            </div>
            @endauth
            <div class="container mt-5">
                <h1>Our Locations</h1>
                <div class="row">
                    @foreach($hotels as $hotel)
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <img src="{{ asset($hotel->image_link) }}" class="card-img-top" alt="{{ $hotel->name }}">
                            <div class="stars">
                                @for ($i = 1; $i <= 5; $i++)
                                @if ($i <= $hotel->stars) 
                                <i class="fa-solid fa-star"></i>
                                @else
                                <i class="fa-regular fa-star"></i>
                                @endif
                                @endfor
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">{{ $hotel->name }}</h5>
                                <p class="card-text">{{ $hotel->description }}</p>
                                <p class="card-text"><i class="fa-solid fa-location-dot"></i>Address: {{ $hotel->address }}</p>
                                <a href="{{ $hotel->google_maps_link }}" target="_blank" class="btn btn-primary">View on Google Maps</a>
                                <a href="home/{{ $hotel->slug }}" class="btn btn-primary">Book Now</a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
