<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomAminity extends Model
{
    use HasFactory;

    protected $table = "roomaminity";
    protected $hidden = ['roomID','amnityID','id','created_at','updated_at'];

    public function aminity(){
        return $this->hasOne(Aminity::class, 'id', 'amnityID');
    }
}
