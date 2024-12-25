<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\SearchItemCollection;
use App\Http\Resources\SearchItemResource;

class Search extends Controller
{
    //

    public function get(Request $request){
        
        $perpage = isset($request->perpage) ? $request->perpage : 50;
        
        $location = isset($request->location) ? $request->location : false;
        
        $adults = isset($request->adults) ? $request->adults : 0;
        $children = isset($request->children) ? $request->childrend : 0;
        $infants = isset($request->infants) ? $request->infants : 0;
        
        $fromDate = $request->from_date;
        $toDate = $request->to_date;
        
        $searchProperty = new \App\Models\Property();
        $query = $searchProperty->newQuery();
        
        
        
        $query->with(['rooms.pricing'=>function($query)use($request){
            $query->where('startDate','<=',$request->from_date)
                  ->where('endDate','>=',$request->to_date);
        }]);
        
        $query->has('rooms');
        $query->has('rooms.pricing');
        
        //$properties = \App\Models\SearchProperty::paginate($perpage);
        //return response(,200);
        
        $data = $query->paginate($perpage);
        return (new SearchItemCollection($data))
                ->additional(['meta' => [
                    'key' => 'value',
                ]]);
        
        //return response((new SearchItemCollection($data)->a()),200);
        
        
    }
    
    public function getProperty(Request $request,$id){
        
        
        
        $adults = isset($request->adults) ? $request->adults : 0;
        $children = isset($request->children) ? $request->childrend : 0;
        $infants = isset($request->infants) ? $request->infants : 0;
        
        $fromDate = $request->from_date;
        $toDate = $request->to_date;
        
        $searchProperty = new \App\Models\Property();
        $query = $searchProperty->newQuery();
        
        
        $query->where('id',$id);
        $query->has('rooms');
        $query->has('rooms.pricing');
        $query->with(["rooms"]);
        
        //$properties = \App\Models\SearchProperty::paginate($perpage);
        //return response(,200);
        
        $data = $query->first();
        return (new SearchItemResource($data));
        
        //return response((new SearchItemCollection($data)->a()),200);
        
        
    }
    
    public function getPrice(Request $request){
        
        $roomid = $request->roomid;
        $pricing = \App\Models\RoomPricing::with(['room'])->where('roomID',$roomid)->where('startDate','<=',$request->from_date)->where('endDate','>=',$request->to_date)->orderBy('adultPrice','ASC')->get();
        
        $propertyRooms = [];
        
        foreach($pricing as $price){
            if(!empty($price->room)){
                $propertyRooms[] = $price;
            }
        }
        
       
        
        $calculatedPrice = 0;
        if(count($propertyRooms) > 0){
            $calculatedPrice = ($propertyRooms[0]->adultPrice * intval($request->adults))+($propertyRooms[0]->childPrice * intval($request->children))+($propertyRooms[0]->infantPrice * intval($request->infants));
        }
        
       return response(['price'=>$calculatedPrice,"priceFormatted"=>number_format($calculatedPrice,2)],200);
    }
    
    
    
    
}
