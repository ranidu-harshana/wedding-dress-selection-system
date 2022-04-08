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
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('bill_number');
            $table->integer('branch_id');
            $table->string('name');
            $table->string('address');
            $table->string('mobile_no1');
            $table->string('mobile_no2')->nullable();
            $table->date('function_date');
            $table->string('function_place')->nullable();
            $table->tinyInteger('no_of_bestmen')->nullable();
            $table->tinyInteger('no_of_pageboys')->nullable();
            $table->tinyInteger('dressing_place'); // if 1 - in the place | 0 - another place
            $table->string('going_away_change_place')->nullable(); // if going away change is YES - NOT NULL otherwise null
            $table->tinyInteger('status')->default(1); // 0 - cancel | 1 - not cancel
            $table->date('postponed')->nullable(); // if not postponed NULL

            $table->text('dress_description')->nullable();
            $table->date('measurement_date')->nullable();
            $table->text('special_notes')->nullable();
            $table->float('total_bill')->nullable();
            $table->float('discount')->nullable();
            $table->float('advance')->nullable();

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
        Schema::dropIfExists('customers');
    }
};
