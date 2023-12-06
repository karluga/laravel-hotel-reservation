<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('room_reservations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained();  // from users table
            $table->foreignId('room_id')->constrained();  // from rooms table
            $table->date('date_from');
            $table->date('date_to');
            $table->integer('number_of_people');
            $table->decimal('price', 8, 2);
            $table->boolean('is_paid')->default(0);
            $table->timestamp('cancelled_at')->nullable();
            $table->timestamps(); // important to determine the price, if it has a sale price or not
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};