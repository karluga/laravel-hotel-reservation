<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class EmailVerifiedListener implements ShouldQueue
{
    use InteractsWithQueue;
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle($event)
    {
        // Delete other entries with the same email (not including the verified user)
        \App\Models\User::where('email', $event->user->email)
            ->where('id', '!=', $event->user->id)
            ->delete();
    }
}