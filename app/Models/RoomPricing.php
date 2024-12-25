<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomPricing extends Model
{
    use HasFactory;
    
    protected $hidden = ['created_at','updated_at'];

    protected $table = "roomPricing";
    
     public function room(){
        return $this->hasOne(Room::class, 'id', 'roomID');
    }
}
