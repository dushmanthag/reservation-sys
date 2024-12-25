<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Rooms extends Controller
{
    public function create(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'phone' => 'required|string|max:255',
            'addressOne' => 'required|string|max:255',            
            'cityID' => 'required|integer|max:20',
            'countryID' => 'required|integer|max:20',           
            'postalCode' => 'required|string|max:20',            
            'propertyTypeID' => 'required|integer|max:20',
            'properyStatus' => 'required|integer|max:20',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        //
        $property = new \App\Models\Property();
        if(isset($request->id) && $request->id != 0){
             
            $property = \App\Models\Property::find($request->id);
        }

        // TODO : Check if the current user has permission to perform this oprtaion


        if(!empty($property)){

            $property->name =  $request->name;
            $property->email =  $request->email;
            $property->phone =  $request->phone;
            $property->addressOne =  $request->addressOne;
            $property->addressTwo =  $request->addressTwo;
            $property->cityID =  $request->cityID;
            $property->countryID =  $request->countryID;
            $property->postalCode =  $request->postalCode;
            $property->locationLat =  $request->locationLat;
            $property->locationLon =  $request->locationLon;
            $property->propertyTypeID =  $request->propertyTypeID;
            $property->properyStatus =  $request->properyStatus;
            $property->cratedUserID =  \Auth::user()->id;
            $property->save();

            return response(['message'=>"operation completed"], 200);
        }        

        return response(['error'=>"Could not perform operation"], 422);
    }
    
    public function get(Request $request){
        $property = \App\Models\Property::where('cratedUserID',\Auth::user()->id)->paginate(20);           

        return response($property, 200);
    }

    public function delete(Request $request){

        if(isset($request->id) && $request->id != 0){
             
            $property = \App\Models\Property::find($request->id);

            if(!empty($property)){
                
                // TODO : Remove complete data tree, rooms and amainities
                
                $property->delete();


                return response(['message'=>"operaion complete"], 200);    
            }
            return response(['error'=>"could not find object"], 404);    
        }

        return response(['error'=>"operation did not comple"], 403);
    }
}
