<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SkinPrice extends Model
{
    use HasFactory;

    protected $fillable = [
        'skin_id',
        'exterior_id',
        'price',
        'stattrak',
        'suvenir',
    ];
    protected $table = "skins_price";
    public $timestamps = false;


    public function getPriceAttribute($val) {
        return number_format($val, 2, '.', ' ');
    }

}