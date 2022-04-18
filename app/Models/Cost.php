<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cost extends Model
{
    use HasFactory;

    protected $fillable = [
        'transport',
        'salary',
        'cleaning',
        'depriciation',
    ];
    
    public function customer() {
        return $this->belongsTo(Customer::class);
    }
}
