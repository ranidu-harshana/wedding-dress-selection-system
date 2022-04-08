<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'status'
    ];

    public function users() {
        return $this->belongsToMany(User::class);
    }

    public function customers() {
        return $this->hasMany(Customer::class);
    }

}