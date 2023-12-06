<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RoomImage extends Model
{
    use HasFactory;

    /**
     * Get the room space associated with the image.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function roomSpace(): BelongsTo
    {
        return $this->belongsTo(RoomSpace::class, 'space_id', 'id');
    }

    /**
     * Get all image rows for a specific room ID with room space information.
     *
     * @param int $roomId
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public static function getAllImagesForRoom($roomId)
    {
        return self::where('room_id', $roomId)->with('roomSpace')->get();
    }
}