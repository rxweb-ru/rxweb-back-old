<?php

namespace App\Http\Controllers;

use App\Models\Rarity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RaritiesController extends Controller
{

    public function RarityList(){

        $Rarity_list = Rarity::all();
        return response($Rarity_list, 200);
    }
    public function RarityAdd(Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
            'color' => 'required',
            'sort' => 'required|integer',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        Rarity::create([
            'title' => $request->input('title'),
            'color' => $request->input('color'),
            'sort' => $request->input('sort'),
        ]);

        return response('success', 201);
    }
    public function RarityDelete(Request $request){

        Rarity::destroy($request->input('id'));

        return response('success', 200);
    }
}
