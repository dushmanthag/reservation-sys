<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingRoom extends Model
{
    use HasFactory;
    protected $hidden = ['created_at','updated_at'];

    protected $table = "bookingRooms";

    public function room(){
        return $this->hasOne(Room::class, 'id', 'roomID');
    }
}
