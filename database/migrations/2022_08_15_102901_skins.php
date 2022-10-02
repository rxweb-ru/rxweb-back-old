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
        Schema::create('skins', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('title_en');
            $table->string('img');
            $table->integer('price')->nullable();
            $table->unsignedBigInteger('rarity_id');
            $table->foreign('rarity_id')->references('id')->on('rarities');
            $table->unsignedBigInteger('gun_id');
            $table->foreign('gun_id')->references('id')->on('guns');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('skins');
    }
};
