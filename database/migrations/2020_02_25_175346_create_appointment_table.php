<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAppointmentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointment', function (Blueprint $table) {
          $table->Increments('id');
          $table->string('appointmentdate');
          $table->string('branch');
          $table->string('speciality');
          $table->string('doctor');
          $table->string('shift');
          $table->string('name');
          $table->string('mobile');
          $table->string('address');
          $table->integer('age');
          $table->string('gender');
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
        Schema::dropIfExists('appointment');
    }
}
