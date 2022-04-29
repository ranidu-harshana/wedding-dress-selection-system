<?php

namespace App\Rules;

use App\Models\Customer;
use App\Models\DressSelection;
use App\Models\Item;
use Illuminate\Contracts\Validation\Rule;

class checkItemAvailability implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($customer_id)
    {
        $this->customer_id = $customer_id;
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
        $customer = Customer::find($this->customer_id);

        $arr = explode(' - ', $value);
        if ($value == NULL) {
            return true;
        }
        try {
            $dresses = DressSelection::where('name', '=', $value)->get();
            if($dresses->count() > 0) {
                foreach ($dresses as $dress) {
                    $result = Customer::where('id', '=', $dress->customer_id)->where('function_date', '<', $customer->function_date)->get();
                    if($result->count() > 0) {
                        return true;
                    }
                }
            }else{
                return true;
            }
            return false;
            
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
        return 'This item is not available.';
    }
}
