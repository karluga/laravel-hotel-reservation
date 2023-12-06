@extends('layouts.app')

@section('content')
    <head>
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

        <!-- RowReorder CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.4.1/css/rowReorder.dataTables.min.css">

        <!-- Responsive CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

        <!-- RowReorder JavaScript -->
        <script src="https://cdn.datatables.net/rowreorder/1.4.1/js/dataTables.rowReorder.min.js"></script>

        <!-- Responsive JavaScript -->
        <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    </head>
    <div class="container mt-5">
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <p><a href="/home" class="text-muted"><i class="fa-solid fa-circle-arrow-left"></i></a> <a href="/home" class="text-muted">Home</a> / <b>My Reservations</b></p>
        <div class="row">
            <div class="col-md-12">
                @if($reservations->isEmpty())
                <h2>Reserve a Room</h2>
                @else
                <h2>Filter Reservations:</h2>
                <form id="searchForm" action="" method="get">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="filter" id="show_relevant" value="show_relevant" {{ $relevantReservations ? 'checked' : '' }}>
                        <label class="form-check-label" for="show_relevant">
                            Show relevant
                        </label>
                    </div>
            
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="filter" id="show_past" value="show_past" {{ $pastReservations ? 'checked' : '' }}>
                        <label class="form-check-label" for="show_past">
                            Show past reservations
                        </label>
                    </div>
            
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="filter" id="show_unpaid" value="show_unpaid" {{ $unpaidReservations ? 'checked' : '' }}>
                        <label class="form-check-label" for="show_unpaid">
                            Show unpaid
                        </label>
                    </div>
            
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="filter" id="show_all" value="show_all" {{ $allReservations ? 'checked' : '' }}>
                        <label class="form-check-label" for="show_all">
                            Show all
                        </label>
                    </div>
                    <script>
                        const radioButtons = document.querySelectorAll('input[type="radio"]');
                        const searchForm = document.getElementById('searchForm');
            
                        radioButtons.forEach(function (radioButton) {
                            radioButton.addEventListener('change', function () {
                                searchForm.submit();
                            });
                        });
                    </script>
                </form>
    
                <table id="reservations" class="table stripe hover row-border order-column">
                    <thead>
                        <tr>
                            <th data-priority="4" scope="col">Hotel</th>
                            <th data-priority="2" scope="col">Room</th>
                            <th scope="col">People</th>
                            <th data-priority="1" scope="col">Date From</th>
                            <th scope="col">Date To</th>
                            <th data-priority="3" scope="col">Is Paid</th>
                            <th scope="col">Price</th>
                            <th scope="col">Actions</th>
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
                                    @if(!$reservation->is_paid)
                                    No
                                    @if(!$reservation->cancelled)
                                    <button class="btn btn-dark">Pay Now $</button>
                                    @endif
                                    @else
                                    Yes
                                    @endif
                                </td>
                                <td>{{ $reservation->price }}</td>
                                <td>
                                    <!-- Add buttons or actions here, e.g., view, edit, delete -->
                                    <a href="" class="btn btn-info">Details</a>
                                    {{-- THIS BUTTON IS SUPPOSED TO GO BACK TO THE ROUTE /{hotel}/{room} WITH ALL THE GET PARAMETERS AS VIEWING BEFORE RESERVING --}}
                                    {{-- THE KEY DIFFERENCE IS THAT WE WILL NEED TO IGNORE ANY NEW PRICE CHANGES FROM THE DATE WHEN RESERVED --}}
                                    {{-- A NEW GET PARAMETER WILL BE NEEDED THAT SAYS WHEN THE SPOT WAS RESERVED --}}
                                    {{-- IN THIS CASE WE DONT NEED TO CHECK IF THE DATES ARE TAKEN --}}
                                    @if(!$reservation->cancelled && !$reservation->is_paid)
                                    <a href="{{ route('home.room', [
                                        'hotel' => $reservation->room->hotel->slug,
                                        'room' => $reservation->room->room_number,
                                        'hidden_reservation_id' => $reservation->id,
                                        'people' => $reservation->number_of_people,
                                        'dates' => \Carbon\Carbon::parse($reservation->date_from)->format('m/d/Y') . ' - ' . \Carbon\Carbon::parse($reservation->date_to)->format('m/d/Y')
                                    ]) }}" class="btn btn-warning">Edit</a>
                                    @endif
                                    @if(!$reservation->cancelled && !$reservation->is_paid)
                                    <form class="d-inline" action="{{ route('reservation.cancel', ['id' => $reservation->id]) }}" method="POST">
                                        @csrf
                                        <button type="submit" class="btn btn-danger">Cancel</button>
                                    </form>
                                    @endif

                                    @if($reservation->cancelled)
                                    <form class="d-inline" action="{{ route('reservation.uncancel', ['id' => $reservation->id]) }}" method="POST">
                                        @csrf
                                        {{-- To re-check if noone chose the same dates --}}
                                        <input type="hidden" name="date_from" value="{{ $reservation->date_from }}">
                                        <input type="hidden" name="date_to" value="{{ $reservation->date_to }}">
                                        <button type="submit" class="btn btn-outline-danger">Un&#8209;cancel</button>
                                    </form>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                @endif
            </div>   
        </div>
    </div>
    <script>
        let dataTable;
        dataTable = $('#reservations').DataTable({
            responsive: true,
        });
    </script>
    <style>
        #reservations{
            width: -webkit-fill-available!important; /* Because inline styles are constantly updated! */
        }
        table.dataTable.dtr-inline.collapsed>tbody>tr>td.dtr-control:before {
            font-family: initial;
        }
    </style>
@endsection
