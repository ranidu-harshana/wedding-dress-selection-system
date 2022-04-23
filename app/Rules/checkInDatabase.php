<?php

namespace App\Rules;

use App\Models\Item;
use Illuminate\Contracts\Validation\Rule;

class checkInDatabase implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $arr = explode(' - ', $value);
        if ($value == NULL) {
            return true;
        }
        try {
            $item_code = $arr[0];
            $item_desc = $arr[1];
            $result = Item::where('item_code', '=', $item_code)->where('item_desc', '=', $item_desc)->get();
            if($result->count() > 0) {
                return true;
            }else{
                return false;
            }
        } catch (\Throwable $th) {
            return false;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Invalid Item. Not in database';
    }
}
