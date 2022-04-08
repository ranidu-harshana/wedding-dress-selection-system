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
            $table->double('head')->default(0.00);
            $table->double('shoulder')->default(0.00);
            $table->double('chest')->default(0.00);
            $table->double('weist')->default(0.00);
            $table->double('tlength')->default(0.00);
            $table->double('ssize')->default(0.00);
            $table->double('arm')->default(0.00);
            $table->double('jheight')->default(0.00);
            $table->double('other')->default(0.00);
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
