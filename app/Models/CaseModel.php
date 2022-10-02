<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CaseModel extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'img',
        'price',
    ];
    protected $table = "cases";
    public $timestamps = false;

    public function getSkin(){
        return $this->hasMany(CaseSkin::class, 'case_id');
    }
}
