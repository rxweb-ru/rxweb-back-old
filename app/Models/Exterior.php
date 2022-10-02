<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Exterior extends Model
{
    protected $fillable = [
        'title',
        'name',
    ];
    public $timestamps = false;
}