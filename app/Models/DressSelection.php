<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DressSelection extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'name',
        'status',
    ];

    public function customer() {
        return $this->belongsTo(Customer::class);
    }
}
