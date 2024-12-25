<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Properties extends Controller
{
    //

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
            
            
            $property->rooms()->delete();
            
            $postRooms = $request->rooms;
            
            
            foreach($postRooms as $postRoom){
                    
                    // if new room added add data
                    
                $newRoom = new \App\Models\Room();
                $newRoom->propertyID = $property->id;
                $newRoom->description = $postRoom['description'];
                $newRoom->numRooms = $postRoom['numRooms'];
                $newRoom->roomTypeID = $postRoom['roomTypeID'];
                $newRoom->numPersons = $postRoom['numPersons'];
                $newRoom->roomSatus = $postRoom['roomSatus'];
                $newRoom->save();
                        
                $postPricings = $postRoom['pricing'];
                $roomAminities= $postRoom['aminities'];
                        
                foreach($postPricings as $postPrice){
                    
                    $newRoomPrice = new \App\Models\RoomPricing();
                    $newRoomPrice->roomID = $newRoom->id;
                    $newRoomPrice->startDate = $postPrice['startDate'];
                    $newRoomPrice->endDate = $postPrice['endDate'];
                    $newRoomPrice->adultPrice = $postPrice['adultPrice'];
                    $newRoomPrice->childPrice = $postPrice['childPrice'];
                    $newRoomPrice->infantPrice = $postPrice['infantPrice'];
                    $newRoomPrice->save();
                    
                }

                foreach($roomAminities as $aminity){
                    $newRoomAminity = new \App\Models\RoomAminity();
                    $newRoomAminity->roomID = $newRoom->id;
                    $newRoomAminity->amnityID = $aminity;
                    $newRoomAminity->save();
                }
                    
                    
                     
            } 
             
            
            return response(['message'=>"operation completed"], 200);
            
            // Remove deleted items first;
            
            $postRooms = $request->rooms();
            $currentRooms =  $property->rooms();
            
            foreach($currentRooms as $curRoom){
                
                $roomFound = false;
                foreach($postRooms as $postRoom){
                    
                    // if new room added add data
                    if(intval($postRoom['id']) == 0){
                        $newRoom = new \App\Models\Room();
                        $newRoom->propertyID = $property->id;
                        $newRoom->description = $postRoom['description'];
                        $newRoom->numRooms = $postRoom['numRooms'];
                        $newRoom->roomTypeID = $postRoom['roomTypeID'];
                        $newRoom->numPersons = $postRoom['numPersons'];
                        $newRoom->roomSatus = $postRoom['roomSatus'];
                        $newRoom->save();
                        
                        $postPricings = $postRoom['pricing'];
                        
                        foreach($postPricings as $postPrice){
                            
                        }
                    }
                    
                    if($postRoom['id'] == $curRoom->id){
                        $roomFound = true;
                    }    
                }
                
                if(!$roomFound){
                    $curRoom->delete();
                }
                
            }
            
            

            
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
    
    public function show(Request $request,$id){

        if(isset($id) && $id != 0){
             
            $property = \App\Models\Property::with('rooms','rooms.pricing','rooms.aminities.aminity')->find($id);

            if(!empty($property)){
                
                // TODO : Remove complete data tree, rooms and amainities
                
                return response($property, 200);    
            }
            return response(['error'=>"could not find object"], 404);    
        }

        return response(['error'=>"operation did not comple"], 403);
    }
}
