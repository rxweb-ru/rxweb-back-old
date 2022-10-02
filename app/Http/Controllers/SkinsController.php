<?php

namespace App\Http\Controllers;

use App\Models\Exterior;
use App\Models\Gun;
use App\Models\Skin;
use App\Models\SkinPrice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;


class SkinsController extends Controller
{

    public function skinList(Request $request){

        $skins = Skin::with('getRarity', 'getGun', 'getPrices')
            ->when($request->query('title'), function($q, $title) {
                return $q->where('title', 'like', '%' . strip_tags($title) . '%');
            })
            ->when($request->query('rarity_id'), function($q, $Rarity_id) {
                return $q->where('rarity_id', $Rarity_id);
            })
            ->when($request->query('gun_id'), function($q, $gun_id) {
                return $q->where('gun_id', $gun_id);
            })
            ->when($request->query('price_from'), function($q, $price) {
                return $q->where('price', '>=', $price);
            })
            ->when($request->query('price_to'), function($q, $price) {
                return $q->where('price', '<=', $price);
            })
            ->when($request->query('sort'), function($q, $sort) {
                if($sort == 'priceFrom'){
                    return $q->orderBy('price', 'desc');
                }
                elseif($sort == 'priceTo'){
                    return $q->orderBy('price', 'asc');
                }
                elseif($sort == 'rarityBest'){
                    return $q->orderBy('rarity_id', 'desc');
                }
                elseif($sort == 'rarityWorse'){
                    return $q->orderBy('rarity_id', 'asc');
                }
            })
            ->paginate(20);

        return response($skins, 200);
    }
    public function skinAdd(Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
            'title_en' => 'required',
            'rarity_id' => 'required|integer|exists:rarities,id',
            'gun_id' => 'required|integer|exists:guns,id',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        if ($request->file('img')->isValid()) {
            $path = $request->img->store('images/skins', 'public');
        }

        $skin = Skin::create([
            'title' => $request->input('title'),
            'title_en' => $request->input('title_en'),
            'img' => $path,
            'price' => $request->input('price'),
            'rarity_id' => $request->input('rarity_id'),
            'gun_id' => $request->input('gun_id'),
        ]);

        if(!empty($request->input('exteriors'))) {
            foreach ($request->input('exteriors') as $key => $val) {
                SkinPrice::create([
                    'skin_id' => $skin->id,
                    'exterior_id' => $key,
                    'price' => $val,
                ]);
            }
        }

        if(!empty($request->input('exteriors_st'))) {
            foreach ($request->input('exteriors_st') as $key => $val) {
                SkinPrice::create([
                    'skin_id' => $skin->id,
                    'exterior_id' => $key,
                    'price' => $val,
                    'stattrak' => 1
                ]);
            }
        }


        return response('success', 201);
    }

    public function skinChangePrice(Request $request){

        SkinPrice::where([['skin_id', $request->input('id')], ['exterior_id', $request->input('exterior_id')]])->delete();

        if(!empty($request->input('price'))){
            SkinPrice::create([
                'skin_id' => $request->input('id'),
                'exterior_id' => $request->input('exterior_id'),
                'price' => $request->input('price'),
            ]);
        }
        if(!empty($request->input('price_st'))){
            SkinPrice::create([
                'skin_id' => $request->input('id'),
                'exterior_id' => $request->input('exterior_id'),
                'price' => $request->input('price_st'),
                'stattrak' => 1
            ]);
        }

        return response('success', 201);
    }

    public function getSkin($id){

        $skin = Skin::with('getRarity', 'getGun', 'getPrices')->where('id', $id)->firstOrFail();

        return response($skin, 200);
    }

    public function skinEdit($id, Request $request){

        $body = Validator::make($request->all(), [
            'title' => 'required',
            'title_en' => 'required',
            'rarity_id' => 'required|integer|exists:rarities,id',
            'gun_id' => 'required|integer|exists:guns,id',
        ]);

        if($body->fails()){
            return response($body->errors(), 400);
        }

        $skin = Skin::where('id', $id)->firstOrFail();
        $skin->update([
            'title' => $request->input('title'),
            'title_en' => $request->input('title_en'),
            'price' => $request->input('price'),
            'rarity_id' => $request->input('rarity_id'),
            'gun_id' => $request->input('gun_id'),
        ]);

        if (!empty($request->file('img')) and $request->file('img')->isValid()) {
            $skin->img = $request->img->store('images/skins', 'public');
            $skin->save();
        }


        SkinPrice::where('skin_id', $id)->delete();
        if(!empty($request->input('exteriors'))) {
            foreach ($request->input('exteriors') as $key => $val) {
                SkinPrice::where('skin_id', $id)->create([
                    'skin_id' => $id,
                    'exterior_id' => $key,
                    'price' => $val
                ]);
            }
        }
        if(!empty($request->input('exteriors_st'))) {
            foreach ($request->input('exteriors_st') as $key => $val) {
                SkinPrice::where('skin_id', $id)->create([
                    'skin_id' => $id,
                    'exterior_id' => $key,
                    'price' => $val,
                    'stattrak' => 1
                ]);
            }
        }

        return response('success', 201);
    }

    public function skinDeleteImage($id) {

        $skin = Skin::where('id', $id)->firstOrFail();

        Storage::disk('public')->delete($skin->img);
        $skin->img = '';
        $skin->save();

        return response('success', 201);
    }

    public function skinDelete(Request $request){

        Skin::destroy($request->input('id'));

        return response('success', 200);
    }

    public function skinsGetPrices(Request $request) {
        /*  config_from: 'without', 'steam', 'market'  |  without_last_price  |  with_avg_price  */
        if($request->input('config_from') == 'market'){

            $skins = Skin::whereIn('id', $request->input('items'))->get();
            foreach ($skins as $skin){
                $this->getPriceFromMarket($skin->gun_id, $skin->title_en, $skin->id, $request->input('without_last_price'));
            }

        } else if($request->input('config_from') == 'steam'){
            /* getPriceFromSteam */
        }

        // Тут по тому что может быть получение средней цены без парсинга
        if($request->input('with_avg_price')){
            $skins = Skin::with('getPrices')->whereIn('id', $request->input('items'))->get();
            foreach ($skins as $skin){
                $avg_price = $skin->getPrices->where('stattrak', null)->avg('price');
                $skin->price = $avg_price;
                $skin->save();
            }
        }

    }

    public function getPriceFromMarket($gun_id, $title_en, $skin_id, $without_last_price = null){

        $gun = Gun::findOrFail($gun_id);
        $exteriors = Exterior::all();
        $response = Http::get('https://market.csgo.com/api/v2/prices/class_instance/RUB.json');
        $res = collect([]);

        foreach ($response['items'] as $item) {
            if(!Str::substrCount($item['market_hash_name'], $gun->title . ' | ' . $title_en)){
                continue;
            }

            foreach ($exteriors as $exterior) {
                if(Str::substrCount($item['market_hash_name'], $gun->title . ' | ' . $title_en . ' (' . $exterior->title_en . ')')){
                    $res[] = collect([
                        'skin_id' => 1,
                        'exterior_id' => $exterior->id,
                        'avg_price' => $item['avg_price'],
                        'price' => $item['price'],
                    ]);
                }
            }
        }

        $avg_price = collect([]);

        foreach ($exteriors->reverse() as $exterior) {

            $avg_price[] = $res->where('exterior_id', $exterior->id)->min('price');

            SkinPrice::create([
                'skin_id' => $skin_id,
                'exterior_id' => $exterior->id,
                'price' => $res->where('exterior_id', $exterior->id)->min('price'),
            ]);
        }

        return round($avg_price->avg(), 2);

    }
}
