@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <p><a href="/admin" class="text-muted"><i class="fa-solid fa-circle-arrow-left"></i></a> <a href="/home" class="text-muted">Home</a> / <b>My Reservations</b></p>
        <div class="row">
            <div class="col-md-12">
                @if($reservations->isEmpty())
                    <h2>No reservations have been made</h2>
                @else
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Hotel</th>
                                <th scope="col">Room</th>
                                <th scope="col">People</th>
                                <th scope="col">Date From</th>
                                <th scope="col">Date To</th>
                                <th scope="col">Is Paid</th>
                                <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($reservations as $reservation)
                                <tr>
                                    <td><a href="/home/{{ $reservation->room->hotel->slug }}">{{ $reservation->room->hotel->name }}</a></td>
                                    <td><a href="/home/{{ $reservation->room->hotel->slug }}/{{ $reservation->room->room_number }}">{{ $reservation->room->room_number }}</a></td>
                                    <td>{{ $reservation->number_of_people }}</td>
                                    <td>{{ $reservation->date_from }}</td>
                                    <td>{{ $reservation->date_to }}</td>
                                    <td>
                                        {!! $reservation->is_paid ? 'Yes' : '<b>No</b>' !!}
                                    </td>
                                    <td>{{ $reservation->price }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                @endif
            </div>   
        </div>
    </div>
@endsection
