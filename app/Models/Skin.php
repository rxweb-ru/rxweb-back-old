<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Skin extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'title_en',
        'img',
        'price',
        'rarity_id',
        'gun_id',
    ];
    public $timestamps = false;

    public function getRarity(){

        return $this->hasOne(Rarity::class, 'id', 'rarity_id');
    }
    public function getGun(){

        return $this->hasOne(Gun::class, 'id', 'gun_id');
    }

    public function getPrices() {

        return $this->hasMany(SkinPrice::class, 'skin_id', 'id');
    }

    public function getPriceAttribute($val) {
        return number_format($val, 0, '.', ' ');
    }
}
