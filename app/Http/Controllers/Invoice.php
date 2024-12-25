<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

use App\Http\Resources\BookingCollection;
use App\Http\Resources\BookingResource;

class Invoice extends Controller
{
    //

    public function get(Request $request){

        $invoice = \App\Models\Invoice::with(['lines'])->find($request->id);

        if(!empty($invoice)){
            return response(['status'=>TRUE,'message'=>'Invoice Found',"data"=>$invoice], 200);
        }
        
        return response(['status'=>FALSE,'message'=>'Invoice not found'], 404);
    }
    
}
