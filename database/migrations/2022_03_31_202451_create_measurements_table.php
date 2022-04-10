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
        Schema::create('measurements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('customer_id')->onDelete('cascade');
            $table->string('type');
            $table->double('head')->nullable();
            $table->double('shoulder')->nullable();
            $table->double('chest')->nullable();
            $table->double('weist')->nullable();
            $table->double('tlength')->nullable();
            $table->double('ssize')->nullable();
            $table->double('arm')->nullable();
            $table->double('jheight')->nullable();
            $table->double('other')->nullable();
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
        Schema::dropIfExists('measurements');
    }
};
