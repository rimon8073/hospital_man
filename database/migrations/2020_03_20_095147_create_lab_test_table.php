<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLabTestTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lab_test', function (Blueprint $table) {
            $table->Increments('id');
            $table->string('cat_name');
            $table->string('test_name');
            $table->string('test_rate');
            $table->string('test_ref_fee');
            $table->string('test_description');
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
        Schema::dropIfExists('lab_test');
    }
}
