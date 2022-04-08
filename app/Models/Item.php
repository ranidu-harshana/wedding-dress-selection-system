<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    protected $fillable = [
        'item_category_id',
        'item_code',
        'item_desc',
        'item_type',
        'item_image_url',
    ];
    public function item_category()
    {
        return $this->belongsTo(ItemCategory::class);
    }
}
