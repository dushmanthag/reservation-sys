<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CommonServices extends Controller
{
    //

    public function create(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        //
        $aminitity = new \App\Models\Aminity();
        if(isset($request->id) && $request->id != 0){             
            $aminitity = \App\Models\Aminity::find($request->id);
        }

        // TODO : Check if the current user has permission to perform this oprtaion


        if(!empty($aminitity)){

            $aminitity->name =  $request->name;            
            $aminitity->save();

            return response(['message'=>"operation completed"], 200);
        }        

        return response(['error'=>"Could not perform operation"], 422);
    }
    
    public function cities(Request $request,$cid){
        $cities = \App\Models\City::where('countryID',$cid)->get();           

        return response($cities, 200);
    }
    
    public function countries(Request $request){
        $countries = \App\Models\Country::get();           

        return response($countries, 200);
    }
    
    public function status(Request $request){
        
        $status = \App\Models\Status::where('type',$request->t)->get();           

        return response($status, 200);
    }

    public function delete(Request $request){

        if(isset($request->id) && $request->id != 0){
             
            $aminity = \App\Models\Aminity::find($request->id);

            if(!empty($aminity)){
                
                // TODO : Remove complete data tree, rooms and amainities
                
                $aminity->delete();


                return response(['message'=>"operaion complete"], 200);    
            }
            return response(['error'=>"could not find object"], 404);    
        }

        return response(['error'=>"operation did not comple"], 403);
    }
}
