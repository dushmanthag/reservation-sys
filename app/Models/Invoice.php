<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;
    protected $hidden = ['created_at','updated_at'];

    protected $table = "invoice";

    public function lines(){
        return $this->hasMany(InvoiceLine::class, 'invoiceId', 'id');
    }
}
