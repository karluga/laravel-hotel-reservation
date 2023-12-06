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
        Schema::create('rooms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('hotel_id')->constrained(); // from hotels table
            $table->foreignId('suite_id')->constrained(); // from suites table
            $table->integer('floor');
            $table->string('room_number');
            $table->string('sq_meters');
            $table->string('utilities');
            $table->string('extras');
            $table->integer('max_people');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rooms');
    }
};
