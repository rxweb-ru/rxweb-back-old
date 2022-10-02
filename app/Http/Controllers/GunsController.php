<?php

namespace App\Http\Controllers;

use App\Models\Gun;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GunsController extends Controller
{

    public function gunList(){

        $guns_list = Gun::all();
        return response($guns_list, 200);
    }
    public function gunAdd(Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        Gun::create([
            'title' => $request->input('title')
        ]);

        return response('success', 201);
    }
    public function gunDelete(Request $request){

        Gun::destroy($request->post('id'));

        return response('success', 200);
    }
}
