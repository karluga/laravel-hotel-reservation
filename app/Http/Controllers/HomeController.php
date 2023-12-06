<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\Room;
use App\Models\RoomSuite;
use App\Models\RoomPrice;
use App\Models\RoomDiscount;
use App\Models\RoomReservation;
use App\Models\RoomImage;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\Log;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->only([
            'processForm',
            'reserved',
            'cancel',
            'uncancel',
        ]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function hotels()
    {
        $hotels = Hotel::all();
        return view('home', ['hotels' => $hotels]);
    }
    public function hotel($slug)
    {
        $hotel = Hotel::where('slug', $slug)->first();

        if (!$hotel) {
            // Handle case where hotel with the specified slug is not found
            abort(404);
        }

        // Get rooms for the hotel
        $rooms = Room::where('hotel_id', $hotel->id)->get();

        // Map suite type to rooms
        $rooms->map(function ($room) {
            $room->suite_type = RoomSuite::find($room->suite_id)->type;
            return $room;
        });

        return view('hotel_info', ['hotel' => $hotel, 'rooms' => $rooms]);
    }
    public function room(Request $request, $slug, $roomNumber)
    {
        $hotel = Hotel::where('slug', $slug)->first();

        if (!$hotel) {
            // Handle case where hotel with the specified slug is not found
            abort(404);
        }

        // Get the room for the hotel based on the room number
        $room = Room::where('hotel_id', $hotel->id)
            ->where('room_number', $roomNumber)
            ->first();

        if (!$room) {
            // Handle case where room with the specified room number is not found
            abort(404);
        }
           // Fetch additional data if needed, for example, suite type
           $room->suite_type = DB::table('room_suites')->where('id', $room->suite)->value('type');

           // Fetch data from the room_prices table
           $roomPrice = RoomPrice::where('room_id', $room->id)
           ->where(function ($query) {
               $now = Carbon::now();
               $query->where(function ($query) use ($now) {
                   $query->where('start_date', '<=', $now)
                       ->where('end_date', '>=', $now);
               })
               ->orWhere(function ($query) {
                   $query->whereNull('end_date');
               });
           })
           ->orderBy('end_date', 'desc') // Order by end_date in descending order
           ->orderBy('created_at', 'desc') // Then, order by created_at in descending order
           ->first(['price_per_day', 'start_date', 'end_date']);
       
       
           // dd($roomPrice);
           // Add the required fields to the $room object
           if ($roomPrice) {
               $room->price_per_day = $roomPrice->price_per_day;
               $room->price_start_date = $roomPrice->start_date;
               $room->price_end_date = $roomPrice->end_date;
           }
        $takenDates = RoomReservation::getAllTakenDatesForRoom($room->id);
    
        $prices = [];

    // GET parameters
    // Check if the selected date range has any taken dates
    if ($request->has('people') && $request->has('dates')) {
        $people = $request->input('people', 1); // Default to 1 if 'people' parameter is not provided
        $dateRange = $request->input('dates');

        // Split the date range
        $dateRange = explode(' - ', $request->input('dates'));
        if(count($dateRange) != 2 || !strtotime($dateRange[0]) || !strtotime($dateRange[1])) {
            // Handle error: date range input is not in the expected format
            abort(400, "Invalid date range");
        }
        list($fromDate, $toDate) = $dateRange;
    
        $hiddenReservationId = $request->has('hidden_reservation_id');

        if (!$hiddenReservationId) {
            // dd($hiddenReservationId);

            // Check if any date in the range is taken
            $rangeHasTakenDates = false;
            $currentDate = Carbon::parse($fromDate);
            while ($currentDate <= Carbon::parse($toDate)) {
                if (in_array($currentDate->format('m/d/Y'), $takenDates)) {
                    $rangeHasTakenDates = true;
                    break;
                }
                $currentDate->addDay();
            }
        
            if ($rangeHasTakenDates) {
                // Handle case where the selected date range has taken dates
                return redirect()->back()->withErrors(['error' => 'Someone has already chosen some of the dates in this interval. Please choose different dates.']);
            }
        } else {
            $takenDates = array_diff($takenDates, RoomReservation::generateDateRange($fromDate, $toDate));

            // Check if any date in the range is taken (excluding current reservation dates)
            $rangeHasTakenDates = false;
            $currentDate = Carbon::parse($fromDate);
            while ($currentDate <= Carbon::parse($toDate)) {
                if (in_array($currentDate->format('Y/m/d'), $takenDates)) {
                    $rangeHasTakenDates = true;
                    break;
                }
                $currentDate->addDay();
            }
        }

        if ($rangeHasTakenDates) {
            // Handle case where the selected date range has taken dates
            return redirect()->back()->withErrors(['error' => 'The selected date range has taken dates. Please choose different dates.']);
        }

        $prices = RoomPrice::calculatePrices($room->id, $people, $fromDate, $toDate);
    }


    $images = RoomImage::getAllImagesForRoom($room->id);


        
        // dd($takenDates);
        return view('room_info', ['hotel' => $hotel, 'room' => $room, 'takenDates' => $takenDates, 'prices' => $prices, 'images' => $images]);
    }

    public function processForm(Request $request)
    {
        $userId = auth()->id();
        if(!$userId) {
            return redirect()->route('login')->withErrors(['login' => 'Please log in to make a reservation.']);
        }
        // Retrieve form data
        $dateRange = $request->input('dates');
        $roomId = $request->input('hidden_room_id');

        // Split the date range
        $dateRange = explode(' - ', $request->input('dates'));
        if(count($dateRange) != 2 || !strtotime($dateRange[0]) || !strtotime($dateRange[1])) {
            // Handle error: date range input is not in the expected format
            abort(400, "Invalid date range");
        }
        list($fromDate, $toDate) = $dateRange;

        $takenDates = RoomReservation::getAllTakenDatesForRoom($roomId);

        // Check if 'fromDate' isn't less than 24 hours before the current time
        $twentyFourHoursAgo = now()->subHours(24);
        if (Carbon::parse($fromDate)->lt($twentyFourHoursAgo)) {
            return redirect()->back()->withErrors(['error' => 'The selected date is less than 24 hours before the current time. Please, choose another one.']);
        }

        $hiddenTotal = $request->input('hidden_total');
        $hiddenPeople = $request->input('hidden_people');

        $hiddenReservationId = $request->input('hidden_reservation_id');

        if (!$hiddenReservationId) {
            // Check if any date in the range is taken
            $rangeHasTakenDates = false;
            $currentDate = Carbon::parse($fromDate);
            while ($currentDate <= Carbon::parse($toDate)) {
                if (in_array($currentDate->format('m/d/Y'), $takenDates)) {
                    $rangeHasTakenDates = true;
                    break;
                }
                $currentDate->addDay();
            }
        
            if ($rangeHasTakenDates) {
                // Handle case where the selected date range has taken dates
                return redirect()->back()->withErrors(['error' => 'The selected date range has taken dates. Please choose different dates.']);
            }
            // Insert data into the "room_reservations" table
            RoomReservation::create([
                'room_id' => $roomId,
                'date_from' => Carbon::parse($fromDate)->format('Y/m/d'),
                'date_to' => Carbon::parse($toDate)->format('Y/m/d'),
                'number_of_people' => $hiddenPeople,
                'is_paid' => false,
                'user_id' => $userId,
                'price' => $hiddenTotal,
            ]);

            // Redirect to the "home.reserved" route
            return redirect()->route('home.reserved')->with('success', 'Reservation submitted successfully');
        } else {
            // Update existing reservation with new information
            $room_reservation = RoomReservation::where('id', $hiddenReservationId)->where('user_id', $userId)->first();

            if ($room_reservation) {
                // Remove current reservation dates from the taken dates
                $takenDates = array_diff($takenDates, RoomReservation::generateDateRange(Carbon::parse($room_reservation->date_from)->format('Y/m/d'), Carbon::parse($room_reservation->date_to)->format('Y/m/d')));

                // Check if 'fromDate' isn't less than 24 hours before the current time
                $twentyFourHoursAgo = now()->subHours(24);
                if (Carbon::parse($fromDate)->lt($twentyFourHoursAgo)) {
                    return redirect()->back()->withErrors(['error' => 'The previous selected date was less than 24 hours before the current time. You can make a new reservation <a href="/home/' . $room_reservation->room->hotel->slug . '/' . $room_reservation->room->room_number . '">here</a>']);
                }
                
                // Check if any date in the range is taken (excluding current reservation dates)
                $rangeHasTakenDates = false;
                $currentDate = Carbon::parse($fromDate);
                while ($currentDate <= Carbon::parse($toDate)) {
                    if (in_array($currentDate->format('Y/m/d'), $takenDates)) {
                        $rangeHasTakenDates = true;
                        break;
                    }
                    $currentDate->addDay();
                }

                if ($rangeHasTakenDates) {
                    // Handle case where the selected date range has taken dates
                    return redirect()->back()->withErrors(['error' => 'The selected date range has taken dates. Please choose different dates.']);
                }

                // Update the existing reservation
                $room_reservation->update([
                    'date_from' => Carbon::parse($fromDate)->format('Y/m/d'),
                    'date_to' => Carbon::parse($toDate)->format('Y/m/d'),
                    'number_of_people' => $hiddenPeople,
                    'price' => $hiddenTotal,
                ]);

                return redirect()->route('home.reserved')->with('success', 'Reservation edited successfully');
            } else {
                abort(400, 'Bad Request: Invalid data provided');
            }
        }
    }
    public function reserved(Request $request)
    {
        $filterAttribute = $request->input('filter');
        $pastReservations = false;
        $unpaidReservations = false;
        $allReservations = false;
        $relevantReservations = false;
    
        // Base query
        $baseQuery = RoomReservation::where('user_id', auth()->id())
            ->with('room.hotel')
            ->orderBy('created_at', 'desc'); // Sort by created_at in descending order
    
        // Apply additional filters based on user input
        if ($filterAttribute === 'show_past') {
            $query = $baseQuery->where('date_to', '<', now()->toDateString()); // Show past reservations
            $pastReservations = true;
        } else if ($filterAttribute === 'show_unpaid') {
            $query = $baseQuery->where('is_paid', 0); // Show only unpaid reservations
            $unpaidReservations = true;
        } else if ($filterAttribute === 'show_all') {
            $query = $baseQuery; // Show all reservations
            $allReservations = true;
        } else {
            $query = $baseQuery->where(function ($query) {
                $query->where('date_to', '>=', now()->toDateString()) // Not a date before today
                    ->orWhere('is_paid', 0); // Unpaid reservations
            });
            $relevantReservations = true;
        }
    
        $reservations = $query->get();
    
        // Use map to add 'cancelled' parameter
        $reservations = $reservations->map(function ($reservation) {
            $reservation->cancelled = !is_null($reservation->cancelled_at);
            return $reservation;
        });

        return view('reserved_rooms', [
            'reservations' => $reservations,
            'relevantReservations' => $relevantReservations,
            'pastReservations' => $pastReservations,
            'unpaidReservations' => $unpaidReservations,
            'allReservations' => $allReservations
        ]);
    }

    public function cancel($id)
    {
        $user_id = auth()->id();
        $room_reservation = RoomReservation::where('id', $id)->where('user_id', $user_id)->first();
    
        if ($room_reservation) {
            // Check if the reservation is not already canceled
            if (!$room_reservation->cancelled_at) {
                $room_reservation->cancelled_at = now();
                $room_reservation->save();
                return redirect()->route('home.reserved')->with('success', 'Reservation has been cancelled successfully');
            } else {
                return redirect()->route('home.reserved')->with('error', 'This reservation has already been cancelled');
            }
        } else {
            return redirect()->route('home.reserved')->with('error', 'Invalid reservation or user');
        }
    }
    
    public function uncancel($id, Request $request)
    {
        $fromDate = $request->input('from_date');
        $toDate = $request->input('to_date');
    
        $user_id = auth()->id();
        $room_reservation = RoomReservation::where('id', $id)->where('user_id', $user_id)->first();
        $takenDates = RoomReservation::getAllTakenDatesForRoom($room_reservation->room_id);

        // Check if 'fromDate' isn't less than 24 hours before the current time
        $twentyFourHoursAgo = now()->subHours(24);
        if (Carbon::parse($fromDate)->lt($twentyFourHoursAgo)) {
            return redirect()->back()->withErrors(['error' => 'The previous selected date was less than 24 hours before the current time. You can make a new reservation <a href="/home/' . $room_reservation->room->hotel->slug . '/' . $room_reservation->room->room_number . '">here</a>']);
        }
        $rangeHasTakenDates = false;
        $currentDate = Carbon::parse($fromDate);
        while ($currentDate <= Carbon::parse($toDate)) {
            if (in_array($currentDate->format('Y/m/d'), $takenDates)) {
                $rangeHasTakenDates = true;
                break;
            }
            $currentDate->addDay();
        }
        if ($rangeHasTakenDates) {
            // Handle case where the selected date range has taken dates
            return redirect()->back()->withErrors(['error' => 'The selected date range has taken dates. Please choose different dates.']);
        }

        // Update the existing reservation
        $affectedRows = $room_reservation->update([
            'cancelled_at' => null,
        ]);

        if ($affectedRows > 0) {
            // The update was successful
            return redirect()->route('home.reserved')->with('success', 'Un-cancelled successfully');
        } else {
            // No rows were updated
            return redirect()->back()->withErrors(['error' => 'The update was not successful.']);
        }
    }
}