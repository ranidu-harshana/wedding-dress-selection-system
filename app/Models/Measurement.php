<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Measurement extends Model
{
    use HasFactory;
    protected $fillable = [
       'type',
       'head',
       'shoulder',
       'chest',
       'weist',
       'tlength',
       'ssize',
       'arm',
       'jheight',
       'other',
    ];

    public function customer() {
        return $this->belongsTo(Customer::class);
    }
}
