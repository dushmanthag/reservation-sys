<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    use HasFactory;

    protected $table = "property";
    protected $appends = ['city','country','photos'];
    
    
    protected $hidden = ['created_at','updated_at'];
    
    public function rooms(){
        return $this->hasMany(Room::class, 'propertyID', 'id');
    }
    
   
    public function cityData(){
        return $this->hasMany(City::class, 'id', 'cityID');
    }
    
    public function countryData(){
        return $this->hasOne(Country::class, 'id', 'countryID');
    }
    
    public function getCityAttribute(){
        return \App\Models\City::find($this->cityID);
    }
    
    public function getCountryAttribute(){
       return \App\Models\Country::find($this->countryID);
    }
    
    
    public function getPhotosAttribute(){
        
        $photos = \App\Models\Photo::where('resource_type','property')->where('resource_id',$this->id)->get();
        
        return $photos;
    }
    
    public function getMinimumPrice($request){
        
        // $rooms = \App\Models\Room::with(['pricing'=>function($query) use($request){
        //     $query->where('startDate','<=',$request->from_date);
        //     $query->where('endDate','>=',$request->to_date);
            
        // }])->where('propertyID',$this->id)->get();
        $propertyId = $this->id;
        $pricing = \App\Models\RoomPricing::with(['room'])->where('startDate','<=',$request->from_date)->where('endDate','>=',$request->to_date)->orderBy('adultPrice','ASC')->get();
        
        $propertyRooms = [];
        
        foreach($pricing as $price){
            if(!empty($price->room) && $price->room->propertyID == $this->id){
                $propertyRooms[] = $price;
            }
        }
        
        $calculatedPrice = 0;
        if(count($propertyRooms) > 0){
            $calculatedPrice = ($propertyRooms[0]->adultPrice * intval($request->adults))+($propertyRooms[0]->childPrice * intval($request->children))+($propertyRooms[0]->infantPrice * intval($request->infants));
        }
        
        return $calculatedPrice;
    }
    
    public function getPromoPrice($request){
        
        // $rooms = \App\Models\Room::with(['pricing'=>function($query) use($request){
        //     $query->where('startDate','<=',$request->from_date);
        //     $query->where('endDate','>=',$request->to_date);
            
        // }])->where('propertyID',$this->id)->get();
        $propertyId = $this->id;
        $pricing = \App\Models\RoomPricing::with(['room'])->where('startDate','<=',$request->from_date)->where('endDate','>=',$request->to_date)->orderBy('adultPrice','DESC')->get();
        
        $propertyRooms = [];
        
        foreach($pricing as $price){
            if(!empty($price->room) && $price->room->propertyID == $this->id){
                $propertyRooms[] = $price;
            }
        }
        
        $calculatedPrice = 0;
        if(count($propertyRooms) > 0){
            $calculatedPrice = ($propertyRooms[0]->adultPrice * intval($request->adults))+($propertyRooms[0]->childPrice * intval($request->children))+($propertyRooms[0]->infantPrice * intval($request->infants));
        }
        
        return $calculatedPrice;
    }
    
}
