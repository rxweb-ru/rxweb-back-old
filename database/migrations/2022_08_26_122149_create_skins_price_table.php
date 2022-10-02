<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('skins_price', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('skin_id');
            $table->foreign('skin_id')->references('id')->on('skins');
            $table->unsignedBigInteger('exterior_id');
            $table->foreign('exterior_id')->references('id')->on('exteriors');
            $table->integer('price');
            $table->boolean('stattrak')->nullable();
            $table->boolean('suvenir')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('skins_price');
    }
};
