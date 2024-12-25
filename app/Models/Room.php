<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $table = "room";
    
    protected $hidden = ['created_at','updated_at'];
    protected $appends = ['photos'];
    
    public function pricing(){
        return $this->hasMany(RoomPricing::class, 'roomID', 'id');
    }

    public function aminities(){
        return $this->hasMany(RoomAminity::class, 'roomID', 'id');
    }
    
    public function property(){
        return $this->hasOne(Property::class, 'id', 'propertyID');
    }
    
    public function type(){
        return $this->hasOne(RoomType::class, 'id', 'roomTypeID');
    }
    
    // this is a recommended way to declare event handlers
    public function delete()
    {
        
        $this->pricing()->delete();
        $this->aminities()->delete();
       
        return parent::delete();
    }
    
    public function getPhotosAttribute(){
        
        $photos = \App\Models\Photo::where('resource_type','room')->where('resource_id',$this->id)->get();
        
        return $photos;
        
        
    }

    public function estimate_cost($from_date,$to_date,$adults,$children,$infant){
        $estimated_cost = 0;
        
        $date1=date_create($from_date);
        $date2=date_create($to_date);
        $diff=date_diff($date1,$date2);

        $interval = \DateInterval::createFromDateString('1 day');
        $daterange = new \DatePeriod($date1, $interval ,$date2);

        $previous_adult_price = 0;
        $previous_children_price = 0;
        $previous_infant_price =0;

        foreach($daterange as $dat1){
            $check_date = $dat1->format('Y-m-d');

            $room_pricing = \App\Models\RoomPricing::where("roomID",$this->id)
                                                   ->where("startDate","<=",$check_date)
                                                   ->where("endDate",">=",$check_date)
                                                   ->orderBy("adultPrice","ASC")->first();

            $adult_price = 0;
            $children_price = 0; 
            $infant_price = 0;
            
            if(!empty($room_pricing)){
                $adult_price = $room_pricing->adultPrice;
                $children_price = $room_pricing->childPrice; 
                $infant_price = $room_pricing->infantPrice;

                $previous_adult_price = $room_pricing->adultPrice;
                $previous_children_price = $room_pricing->childPrice; 
                $previous_infant_price = $room_pricing->infantPrice;
            }else{

                $adult_price = $previous_adult_price;
                $children_price = $previous_children_price; 
                $infant_price = $previous_infant_price;
            }


            $estimated_cost += ($adults*$adult_price)+($children*$children_price)+($infant*$infant_price);

        }

        

        return $estimated_cost;
    }
}
