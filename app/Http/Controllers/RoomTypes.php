<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RoomTypes extends Controller
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
        $roomType = new \App\Models\RoomType();
        if(isset($request->id) && $request->id != 0){             
            $roomType = \App\Models\RoomType::find($request->id);
        }

        // TODO : Check if the current user has permission to perform this oprtaion


        if(!empty($roomType)){

            $roomType->name =  $request->name;            
            $roomType->save();

            return response(['message'=>"operation completed"], 200);
        }        

        return response(['error'=>"Could not perform operation"], 422);
    }
    
    public function get(Request $request){
        $roomTypes = \App\Models\RoomType::get();           

        return response($roomTypes, 200);
    }

    public function delete(Request $request){

        if(isset($request->id) && $request->id != 0){
             
            $roomType = \App\Models\RoomType::find($request->id);

            if(!empty($roomType)){
                
                // TODO : Remove complete data tree, rooms and amainities
                
                $roomType->delete();


                return response(['message'=>"operaion complete"], 200);    
            }
            return response(['error'=>"could not find object"], 404);    
        }

        return response(['error'=>"operation did not comple"], 403);
    }
}
