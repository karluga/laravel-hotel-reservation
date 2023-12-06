@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <p><a href="/home" class="text-muted"><i class="fa-solid fa-circle-arrow-left"></i></a> <a href="/home" class="text-muted">Home</a> / <b>{{ $hotel->name }}</b></p>
        <div class="card">
            <img src="{{ asset($hotel->image_link) }}" class="card-img-top" alt="{{ $hotel->name }}">
            <div class="card-body">
                <div class="stars">
                @php
                @endphp
                @for ($i = 1; $i <= 5; $i++)
                    @if ($i <= $hotel->stars) 
                    <i class="fa-solid fa-star"></i>
                    @else
                    <i class="fa-regular fa-star"></i>
                    @endif
                @endfor                
                </div>
                <h5 class="card-title">{{ $hotel->name }}</h5>
                <p class="card-text">{{ $hotel->description }}</p>
                <p class="card-text"><i class="fa-solid fa-location-dot"></i>Address: {{ $hotel->address }}</p>
                <a href="{{ $hotel->google_maps_link }}" target="_blank" class="btn btn-primary">View on Google Maps</a>
            </div>
        </div>
    </div>
    
    <div class="container mt-5">
        <h1>Available Rooms</h1>

        @if($rooms->isEmpty())
            <p>No rooms available.</p>
        @else
            @php
                $currentFloor = null;
            @endphp

            @foreach($rooms as $room)
                @if($currentFloor !== $room->floor)
                    @if($currentFloor !== null)
                        </div>
                    @endif

                    <h2>Floor {{ $room->floor }}</h2>
                    <div class="row">
                    @php
                        $currentFloor = $room->floor;
                    @endphp
                @endif

                <div class="col-md-3 mb-4">
                    <div class="card position-relative">
                        {{-- <div class="ribbon ribbon-top-right"><span>sale</span></div></div> --}}
                        <div class="card-body">
                            <h5 class="card-title">Room 
                                <div class="room-number">{{ $room->room_number }}</div>
                            </h5>
                            <p class="card-text">Suite: {{ $room->suite_type }}</p>
                            <p class="card-text">Utilities: {{ $room->utilities }}</p>
                            <p class="card-text">Extras: {{ $room->extras }}</p>
                            <p class="card-text">Max People: {{ $room->max_people }}</p>
                            <a href="{{ $hotel->slug }}/{{ $room->room_number }}" class="btn btn-primary">View</a>
                        </div>
                    </div>
                </div>
            @endforeach

            </div>
        @endif
    </div>
@endsection
