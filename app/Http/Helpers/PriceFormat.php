<?php


namespace App\Http\Helpers;


class PriceFormat
{

    public function setPrice($price) {

    }

    public function format_price($value)
    {
        if ($value > 0) {
            $value = number_format($value, 2, ',', ' ');
            $value = str_replace(',00', '', $value);

            return $value;
        }

    }
}