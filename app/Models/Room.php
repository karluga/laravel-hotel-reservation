<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    public function hotel()
    {
        // dd($this->belongsTo(Hotel::class));

        return $this->belongsTo(Hotel::class);
    }
}
