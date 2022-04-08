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
        Schema::create('dress_selections', function (Blueprint $table) {
            $table->id();
            $table->foreignId('customer_id')->onDelete('cascade');
            $table->string('type');
            $table->string('name');
            $table->tinyInteger('status')->default(0); // if 0 - available
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
        Schema::dropIfExists('dress_selections');
    }
};
