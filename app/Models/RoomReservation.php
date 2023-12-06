<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomReservation extends Model
{
    use HasFactory;
    protected $fillable = [
        'room_id',
        'date_from',
        'date_to',
        'number_of_people',
        'is_paid',
        'user_id',
        'price',
        'cancelled_at',
    ];
    public function room()
    {
        return $this->belongsTo(Room::class);
    }
    
    /**
     * Get an array of all taken dates for a specific room without duplicates.
     *
     * @param int $roomId
     * @return array
     */
    public static function getAllTakenDatesForRoom($roomId)
    {
        // Retrieve taken dates for the specified room
        $takenDates = self::where('room_id', $roomId)
            ->select('date_from', 'date_to')
            ->get();

        // Create a flat array of all unique taken dates
        $formattedDates = [];

        foreach ($takenDates as $takenDate) {
            $dateRanges = self::generateDateRange($takenDate->date_from, $takenDate->date_to);
            $formattedDates = array_merge($formattedDates, $dateRanges);
        }

        // Remove duplicates by converting the array to a set and back to an array
        $uniqueDates = array_values(array_unique($formattedDates));

        return $uniqueDates;
    }

    /**
     * Generate date ranges between two dates (inclusive).
     *
     * @param string $startDate
     * @param string $endDate
     * @return array
     */
    public static function generateDateRange($startDate, $endDate)
    {
        $start = strtotime($startDate);
        $end = strtotime($endDate);
        $dateRanges = [];

        while ($start <= $end) {
            $dateRanges[] = date('m/d/Y', $start);
            $start = strtotime('+1 day', $start);
        }

        return $dateRanges;
    }
}