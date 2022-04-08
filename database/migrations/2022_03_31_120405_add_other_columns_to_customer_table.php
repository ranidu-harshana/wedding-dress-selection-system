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
        Schema::table('customers', function (Blueprint $table) {
            $table->string('bridal_dressing_place')->nullable();
            $table->string('bridal_color')->nullable();
            $table->string('sec_bridal_group_color')->nullable();
            $table->string('photography_place')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customers', function (Blueprint $table) {
            $table->dropColumn('bridal_dressing_place');
            $table->dropColumn('bridal_color');
            $table->dropColumn('sec_bridal_group_color');
            $table->dropColumn('photography_place');
        });
    }
};
