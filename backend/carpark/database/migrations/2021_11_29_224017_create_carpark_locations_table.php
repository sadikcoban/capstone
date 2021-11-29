<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarparkLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::create('carpark_locations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('owner_id')
                    ->constrained('owners')
                    ->onUpdate('CASCADE')
                    ->onDelete('RESTRICT');
            $table->integer('capacity');
            $table->integer('start_hour');
            $table->integer('end_hour');
            $table->string('lat');
            $table->string('lon');
            $table->boolean('is_active')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('carpark_locations');
    }
}
