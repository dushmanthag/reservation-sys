<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Aminity extends Model
{
    use HasFactory;

    protected $table = "aminity";
    protected $hidden = ['created_at','updated_at'];
}
