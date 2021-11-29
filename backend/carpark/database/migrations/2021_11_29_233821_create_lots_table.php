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
            $table->string('status');
            $table->string('name');
            $table->string('coord_x1');
            $table->string('coord_x2');
            $table->string('coord_y1');
            $table->string('coord_y2');
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
