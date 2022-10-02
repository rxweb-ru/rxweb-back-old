<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CaseSkin extends Model
{
    use HasFactory;

    protected $fillable = [
        'case_id',
        'skin_id',
    ];
    protected $table = "cases_skins";
    public $timestamps = false;
}
