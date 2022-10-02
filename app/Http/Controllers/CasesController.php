<?php

namespace App\Http\Controllers;

use App\Models\CaseModel;
use App\Models\CaseSkin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CasesController extends Controller
{

    public function caseList(){

        $cases = CaseModel::with('getSkin')->get();
        return response($cases, 200);
    }
    public function caseAdd(Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
            'img' => 'required',
            'price' => 'required|integer',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        $case = CaseModel::create([
            'title' => $request->input('title'),
            'img' => $request->input('img'),
            'price' => $request->input('price'),
        ]);

        CaseSkin::create([
            'case_id' => $case->id,
            'skin_id' => $request->input('skins')
        ]);

        return response('success', 201);

    }
    public function caseDelete(Request $request){

        CaseSkin::where('case_id', $request->input('id'))->delete();
        CaseModel::destroy($request->input('id'));

        return response('success', 200);
    }
}
