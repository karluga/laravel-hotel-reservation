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
        Schema::create('room_discounts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('room_id')->constrained(); // from room_prices table
            $table->date('start_date');
            $table->date('end_date');
            $table->decimal('discount', 8, 2);
            $table->tinyInteger('level')->unsigned()->default(0);
            // 0 - nothing special (gray color), 
            // 1 - noticable sale (yellow color), 
            // 2 - special sale (red color), 

            $table->string('occasion')->default(null);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('room_discounts');
    }
};
