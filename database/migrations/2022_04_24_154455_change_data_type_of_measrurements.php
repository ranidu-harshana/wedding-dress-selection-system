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
        Schema::table('measurements', function (Blueprint $table) {
            $table->string('head')->nullable()->change();
            $table->string('shoulder')->nullable()->change();
            $table->string('chest')->nullable()->change();
            $table->string('weist')->nullable()->change();
            $table->string('tlength')->nullable()->change();
            $table->string('ssize')->nullable()->change();
            $table->string('arm')->nullable()->change();
            $table->string('jheight')->nullable()->change();
            $table->string('other')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('measurements', function (Blueprint $table) {
            //
        });
    }
};
