<?php

namespace App\Http\Controllers;

use App\Models\Exterior;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ExteriorsController extends Controller
{

    public function exteriorsList(){

        $guns_list = Exterior::all();
        return response($guns_list, 200);
    }
    public function exteriorAdd(Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
            'name' => 'required',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        Exterior::create([
            'title' => $request->input('title'),
            'name' => $request->input('name')
        ]);

        return response('success', 201);
    }
    public function exteriorDelete(Request $request){

        Exterior::destroy($request->post('id'));

        return response('success', 200);
    }
}
