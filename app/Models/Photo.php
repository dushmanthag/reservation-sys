<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{
    use HasFactory;
    protected $hidden = ['created_at','updated_at'];
    protected $appends = ['url'];
    protected $table = "photos";
    
    public function getUrlAttribute(){
        
        
        return url("/photo/". $this->id);
        
        
    }
    
    
}
