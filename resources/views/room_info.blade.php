@extends('layouts.app')

@section('content')
<div class="container mt-5">
   <p><a href="/home/{{ $hotel->name }}" class="text-muted"><i class="fa-solid fa-circle-arrow-left"></i></a> <a href="/home" class="text-muted">Home</a> / <a href="/home/{{ $hotel->slug }}" class="text-muted">{{ $hotel->name }}</a> / <b>Room {{ $room->room_number }}</b></p>
    <div class="row">
        <div class="col-md-6">
            <h1>Room Information</h1>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Room
                        <div class="room-number">{{ $room->room_number }}</div>
                    </h5>
                    <div class="row">
                        <div class="col-md-6">
                            <i class="fa-solid fa-heart"></i><p class="card-text">Suite Type: {{ $room->suite_type }}</p>
                        </div>
                        <div class="col-md-6">
                            <i class="fa-solid fa-lightbulb"></i><p class="card-text">Utilities: {{ $room->utilities }}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <i class="fa-solid fa-star"></i><p class="card-text">Extras: {{ $room->extras }}</p>
                        </div>
                        <div class="col-md-6">
                            <i class="fa-solid fa-bed"></i><p class="card-text">Max People: {{ $room->max_people }}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-auto">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#imageModal">
                                View Images
                            </button>
                        </div>
                        <div class="col-md-6">
                            <i class="fa-solid fa-tag"></i><p>Price per night: {{ $room->price_per_day }}€</p>
                            <p class="text-muted">Price may vary depending on day of week.</p>
                        </div>
                    </div>             
                </div>
            </div>
        </div> 
        <div class="col-md-6">
            @if(isset($_GET['hidden_reservation_id']))
            <h1>Editing Reservation...</h1>
            @else
            <h1>Reservation Form</h1>
            @endif
            <div class="card">
                <div class="card-body">
                    <form action="" method="GET">
                        @if(isset($_GET['hidden_reservation_id']))
                        <input type="hidden" name="hidden_reservation_id" value="{{ $_GET['hidden_reservation_id'] }}" />
                        @endif
                        <div class="row">
                            <div class="col-md-12">
                                <i class="fa-solid fa-calendar-days"></i>
                                <label for="dates">Pick a Date Range:</label>
                                <input type="text" name="dates" value="{{ request('dates') }}" />
                                @if($errors->any())
                                <div class="alert alert-danger">
                                    {{ $errors->first('error') }}
                                </div>
                                @endif
                                <p class="text-muted">Please do not write in the field, instead click on it and select the date from the calendar. If you want to select a single date then click on it 2 times.</p>
                            </div>
                        </div>
                
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <i class="fa-solid fa-users"></i>
                                <label for="people">Number of People:</label>
                                <select name="people" id="people">
                                    @for ($i = 1; $i <= $room->max_people; $i++)
                                        <option value="{{ $i }}" {{ $i == 1 ? 'selected' : '' }}>{{ $i }}</option>
                                    @endfor
                                </select>
                            </div>
                        </div>
                
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary">Calculate Price</button>
                            </div>
                        </div>
                    </form>
                    @if (!empty($prices['total']))
                    <a href="{{ url()->full() }}"></a>
                    <div>Copy Link:<br> <a style="display: none;" href="{{ url()->full() }}">{{ url()->full() }}</a><button style="all: unset; cursor: pointer;" class="ml-1" onclick="copyCode(this)"><i class="fa fa-duotone fa-clone"></i></button></div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>From</th>
                                <th>To</th>
                                <th>Price per Night</th>
                                <th>Nights</th>
                                <th>Sum</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($prices['intervals'] as $interval)
                                <tr>
                                    <td>{{ $interval['from'] }}</td>
                                    <td>{{ $interval['to'] }}</td>
                                    <td>{{ $interval['price_per_night'] }}</td>
                                    <td>{{ $interval['nights'] }}</td>
                                    <td>{{ $interval['sum'] }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3" class="text-right"><b>Total:</b></td>
                                <td>{{ $prices['nights'] }}</td>
                                <td>{{ $prices['total'] }}</td>
                            </tr>
                        </tfoot>
                    </table>
                    <form action="" method="POST">
                        @csrf
                        <input type="hidden" name="hidden_dates" value="{{ request('dates') }}" />
                        <input type="hidden" name="hidden_total" value="{{ $prices['total'] }}" />
                        <input type="hidden" name="hidden_people" value="{{ request('people') }}" />
                        <input type="hidden" name="hidden_room_id" value="{{ $room->id }}" />
                        @auth
                            @if(isset($_GET['hidden_reservation_id']))
                            <input type="hidden" name="hidden_reservation_id" value="{{ $_GET['hidden_reservation_id'] }}" />
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            @else
                            <button type="submit" class="btn btn-primary">Submit Reservation</button>
                            @endif
                        @else
                            <a href="/login" class="btn btn-secondary">Log-in to make a reservation</a>
                        @endauth
                    </form>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Image Slider</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <!-- Carousel images -->
                        @foreach($images as $key => $image)
                        <div class="carousel-item{{ $key === 0 ? ' active' : '' }}">
                            <img src="{{ asset('storage/images/' . $image->filename) }}" class="d-block w-100" alt="{{ $image->roomSpace->name }}">
                        </div>
                        @endforeach
                        {{-- <div class="carousel-item">
                            <img src="https://source.unsplash.com/random" class="d-block w-100" alt="Image 2">
                        </div> --}}
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <!-- Indicators -->
                    <ol class="carousel-indicators list-unstyled">
                    @foreach($images as $key => $image)
                        <li data-bs-target="#imageCarousel" data-bs-slide-to="{{ $key }}" class="{{ $key === 0 ? 'active' : '' }}"></li>
                    @endforeach         
                        {{-- <li data-bs-target="#imageCarousel" data-bs-slide-to="0" class="active"></li>
                        <li data-bs-target="#imageCarousel" data-bs-slide-to="1"></li> --}}
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    /* Styles for dates in the past */
.daterangepicker td.day.disabled {
    background-color: #f2f2f2;
    color: #999999;
}

/* Styles for other restricted dates */
.daterangepicker td.day.restricted {
    background-color: #ffcccc;
    color: #ff0000;
}
</style>
<script>

var takenDates = @json($takenDates);
if (!Array.isArray(takenDates)) {
    // Convert the object to an array
    takenDates = Object.values(takenDates);
    console.log(takenDates);
}
$('input[name="dates"]').daterangepicker({
    locale: {
        format: 'MM/DD/YYYY'
    },
    minDate: "{{ now()->format('m/d/Y') }}", // Restrict to dates starting from today
    isInvalidDate: function(date) {
    // Check if the date is in the takenDates array
    return takenDates.indexOf(date.format('MM/DD/YYYY')) !== -1;
    
    },
    beforeShowDay: function(date) {
        // Check if the date is in the takenDates array
        var isDisabled = takenDates.indexOf(date.format('MM/DD/YYYY')) !== -1;
        // Check if the date is overlapping with any disabled dates
        var isOverlapping = false;
        for (var i = 0; i < takenDates.length; i++) {
            var disabledDate = moment(takenDates[i], 'MM/DD/YYYY');
            if (date.isBetween(disabledDate.clone().subtract(1, 'days'), disabledDate.clone().add(1, 'days'), null, '[]')) {
                isOverlapping = true;
                break;
            }
        }
        // Return the appropriate class based on the date's status
        if (isDisabled) {
            return [false, 'disabled-date'];
        } else if (isOverlapping) {
            return [false, 'overlapping-date'];
        } else {
            return [true, ''];
        }
    },
});
    function copyCode(button) {
    // Get the text from the anchor element
    const code = button.previousElementSibling.textContent.trim();

    if (navigator.clipboard) {
        // Copy the text to clipboard using the Clipboard API
        navigator.clipboard.writeText(code).then(() => {
            // Change the button text for 2 seconds
            button.innerHTML = '<i class="fa fa-solid fa-check-square"></i>Copied!';
            setTimeout(function() {
                button.innerHTML = '<i class="fa fa-duotone fa-clone"></i>';
            }, 2000);
        });
    } else {
        // Copy the text to clipboard manually
        const tempInput = document.createElement('textarea');
        tempInput.value = code;
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand('copy');
        document.body.removeChild(tempInput);

        // Change the button text for 2 seconds
        button.innerHTML = 'Copied!<i class="fa fa-solid fa-check-square"></i>';
        setTimeout(function() {
            button.innerHTML = '<i class="fa fa-duotone fa-clone"></i>';
        }, 2000);
    }
}

</script>
@endsection