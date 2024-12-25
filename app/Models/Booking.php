<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;
    protected $hidden = ['updated_at'];
    protected $appends = ['status_code'];

    protected $table = "booking";

    public function rooms(){
        return $this->hasMany(BookingRoom::class, 'bookingID', 'id');
    }
    
    public function invoice(){
        return $this->hasOne(Invoice::class,'id','bookingId');
    }

    public function getStatusCodeAttribute(){        
        
        return \App\Models\Status::where('code',$this->status)->where('type',"booking")->first();
        
        
    }
}
