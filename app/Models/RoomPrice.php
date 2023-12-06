<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class RoomPrice extends Model
{
    use HasFactory;

    public static function calculatePrices($RoomId, $people, $fromDate, $toDate)
    {
        // STEP 1: get the data from the URL parameters and query the database
        $from = Carbon::createFromFormat('m/d/Y', $fromDate);
        $to = Carbon::createFromFormat('m/d/Y', $toDate);
    
        // Get the default price where end_date is null, ordered by created_at
        $defaultPrice = self::where('room_id', $RoomId)
            ->whereNull('end_date')
            ->orderBy('created_at', 'desc')
            ->first();
    
        // Get all price intervals that match the overall interval
        $intervals = self::where('room_id', $RoomId)
            ->where(function ($query) use ($from, $to) {
                $query->whereBetween('start_date', [$from, $to])
                    ->orWhere(function ($query) use ($from, $to) {
                        $query->whereNotNull('start_date') // Exclude intervals where start_date is null
                            ->whereBetween('created_at', [$from, $to]);
                    });
            })
            ->whereNotNull('end_date') // Exclude intervals where end_date is null
            ->orderBy('created_at', 'desc') // Order by created_at in descending order
            ->get();

        // STEP 2: filter out the intervals so only the newer ones are chosen
        $adjustedIntervals = [];
        $seenDates = [];
        
        foreach ($intervals as $interval) {
            $intervalStartDate = Carbon::createFromFormat('Y-m-d', $interval->start_date);
            $intervalEndDate = Carbon::createFromFormat('Y-m-d', $interval->end_date);
        
            $adjustedInterval = $interval; // Create a copy of the interval
        
            // Check for overlap using Carbon methods
            foreach ($seenDates as $seenDate) {
                if ($intervalStartDate->lessThanOrEqualTo($seenDate) && $intervalEndDate->greaterThanOrEqualTo($seenDate)) {
                    // Adjust both start and end date of the overlapping interval
                    $adjustedInterval->start_date = $intervalStartDate->min($seenDate->subDay())->toDateString();
                    $adjustedInterval->end_date = $intervalEndDate->max($seenDate->addDay())->toDateString();
                }
            }
        
            $adjustedIntervals[] = $adjustedInterval;
            $seenDates = array_merge($seenDates, $intervalStartDate->toPeriod($intervalEndDate)->toArray());
        }
        
        // Sort the adjusted intervals by start_date in ascending order
        usort($adjustedIntervals, function ($a, $b) {
            return strcmp($a->start_date, $b->start_date);
        });
        
        $intervals = $adjustedIntervals;
            
        // STEP 3: calculate the prices based on intervals and assign them to an array
        $prices = [
            'intervals' => [],
            'nights' => 0,
            'total' => 0,
        ];

        $currentDate = $from->copy();

        while ($currentDate < $to) {
            $nextInterval = collect($intervals)->first(function ($interval) use ($currentDate) {
                return Carbon::createFromFormat('Y-m-d', $interval->start_date) <= $currentDate &&
                    ($interval->end_date === null || Carbon::createFromFormat('Y-m-d', $interval->end_date) > $currentDate);
            });

            if ($nextInterval) {
                $intervalEndDate = min($to, Carbon::createFromFormat('Y-m-d', $nextInterval->end_date));
                $nights = $currentDate->diffInDays($intervalEndDate);
                $sum = $nights * $nextInterval->price_per_day;

                $prices['intervals'][] = [
                    'from' => $currentDate->format('m/d/Y'),
                    'to' => $intervalEndDate->format('m/d/Y'),
                    'price_per_night' => $nextInterval->price_per_day,
                    'nights' => $nights,
                    'sum' => $sum,
                ];
                
                $prices['total'] += $sum;
                $prices['nights'] += $nights;

                $currentDate = $intervalEndDate;
            } else {
                // No matching interval found, fill the gap with default price
                $defaultEndDate = min($to, $currentDate->copy()->addDays(1));
                $defaultNights = $currentDate->diffInDays($defaultEndDate);
                $defaultSum = $defaultNights * $defaultPrice->price_per_day;

                // Check if the previous interval has the same price
                $previousInterval = end($prices['intervals']);
                if ($previousInterval && $previousInterval['price_per_night'] === $defaultPrice->price_per_day) {
                    $previousInterval['to'] = $defaultEndDate->format('m/d/Y');
                    $previousInterval['nights'] += $defaultNights;
                    $previousInterval['sum'] += $defaultSum;
                    $prices['intervals'][array_key_last($prices['intervals'])] = $previousInterval;
                } else {
                    $prices['intervals'][] = [
                        'from' => $currentDate->format('m/d/Y'),
                        'to' => $defaultEndDate->format('m/d/Y'),
                        'price_per_night' => $defaultPrice->price_per_day,
                        'nights' => $defaultNights,
                        'sum' => $defaultSum,
                    ];
                }

                $prices['total'] += $defaultSum;
                $prices['nights'] += $defaultNights;

                $currentDate = $defaultEndDate;
            }
        }

        return $prices;
    }
}