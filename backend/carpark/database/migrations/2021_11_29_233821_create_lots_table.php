<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::create('lots', function (Blueprint $table) {
            $table->id();
            $table->foreignId('camera_id')
                    ->constrained('cameras')
                    ->onUpdate('CASCADE')
                    ->onDelete('RESTRICT');
            $table->string('status')->nullable();
            $table->string('wrong_plate')->nullable();
            $table->string('name');
            $table->double('coord_x1');
            $table->double('coord_x2');
            $table->double('coord_y1');
            $table->double('coord_y2');
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
        Schema::dropIfExists('lots');
    }
}
