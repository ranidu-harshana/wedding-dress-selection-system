<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $fillable = [
        'bill_number',
        'branch_id',
        'name',
        'address',
        'mobile_no1',
        'mobile_no2',
        'function_date',
        'function_place',
        'no_of_bestmen',
        'no_of_pageboys',
        'dressing_place',
        'going_away_change_place',
        'status',
        'postponed',
        'dress_description',
        'measurement_date',
        'special_notes',
        'bridal_dressing_place',
        'bridal_color',
        '2bridal_group_color',
        'photography_place',
        'total_amount',
        'discount',
        'advance_payment',
    ];

    public function notes()
    {
        return $this->hasMany(Note::class)->orderBy('created_at', 'DESC');
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function dress_selections()
    {
        return $this->hasMany(DressSelection::class);
    }

    public function branch() {
        return $this->belongsTo(Branch::class);
    }

    public function intering_payments() {
        return $this->hasMany(InteringPayment::class);
    }

    public function measurements() {
        return $this->hasMany(Measurement::class);
    }

    public function cost() {
        return $this->hasOne(Cost::class);
    }
}
