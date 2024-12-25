<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\SearchItemCollection;
use App\Http\Resources\SearchItemResource;
use App\Http\Resources\SupplierProfileResource;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\BookingCollection;
use App\Http\Resources\BookingResource;
use App\Http\Resources\SupplierBookingResource;

class Suppliers extends Controller
{

    public function get_booking_list(Request $request){

        $user = \Auth::user();

        $perpage = isset($request->perpage) ? $request->perpage : 50;
        
        $queryBooking = new \App\Models\Booking();
        $query = $queryBooking->newQuery();
        
        $query->whereHas("rooms.room.property",function($query) use ($user){
            $query->where("cratedUserID",$user->id);
        });

        $query->when((isset($request->checkin_from) && !empty($request->checkin_from)),function($query) use ($request){
            $query->where("checkinDate",">=",$request->checkin_from);
        });

        $query->when((isset($request->checkin_to) && !empty($request->checkin_to)),function($query) use ($request){
            $query->where("checkinDate","<=",$request->checkin_to);
        });


        $query->when((isset($request->customer) && !empty($request->customer)),function($query) use ($request){
            $query->where("guestFirstName","like","%".$request->customer."%");
            $query->orWhere("guestLastName","like","%".$request->customer."%");
            $query->orWhere("guestEmail","like","%".$request->customer."%");
        });

        $query->when((isset($request->status) && !empty($request->status)),function($query) use ($request){
            $query->where("status",$request->status);
        });
        
        $data = $query->paginate($perpage);
        return (new BookingCollection($data))
                ->additional(['meta' => [
                    'key' => 'value',
                ]]);
    }

    public function show_booking(Request $request,$id){
        $user = \Auth::user();

        $perpage = isset($request->perpage) ? $request->perpage : 50;
        
        $queryBooking = new \App\Models\Booking();
        $query = $queryBooking->newQuery();

        $query->with("rooms.room");

        $query->where('id',$id);

        $data = $query->first();

        return response(['data'=>new SupplierBookingResource($data)], 200);
    }

    public function confirm_booking(Request $request){

        $queryBooking = new \App\Models\Booking();
        $query = $queryBooking->newQuery();

        $query->where('id',$request->bookingId);

        $data = $query->first();

        $data->status = 2;
        $data->save();

        return response(['message'=>"Booking updated"], 200);
    }

    public function cancel_booking(Request $request){
        
        $queryBooking = new \App\Models\Booking();
        $query = $queryBooking->newQuery();

        $query->where('id',$request->bookingId);

        $data = $query->first();

        $data->status = 3;
        $data->save();

        return response(['message'=>"Booking updated"], 200);

    }

    public function dashboard(Request $request){
        return response(['data'=>["bookings"=>0,
                                  "upcoming_bookings"=>0,
                                  "total_revenue"=>0,
                                  "pending_cancellations"=>0]], 200);
    }

    public function show_profile(Request $request){
        $user = \Auth::user();

        if(empty($user)){
            return response(['message'=>"User not found"], 404);
        }    
        
        return response(['data'=>new SupplierProfileResource($user)], 200);
        
    }

    public function update_profile(Request $request){
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $user = \Auth::user();

        if(!empty($user)){

            $user->firstName = $request->firstName;
            $user->lastName = $request->lastName;
            $user->email = $request->email;
            $user->save();

            return response(['data'=>new SupplierProfileResource($user)], 200);
        }
    }

    public function change_password(Request $request){
        $validator = Validator::make($request->all(), [
            'currentPassword' => 'required|string|max:255',
            'newPassword' => 'required|string|max:255',
            'confirmPassword' => 'required|string|max:255',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $user = \Auth::user();
        
        if(!empty($user)){

            if(Hash::check($request->password, $user->password)){
                
                if($request->newPassword === $request->confirmPassword){

                    $user->password = Hash::make($request->password);
                    $user->save();

                    return response(['message'=>"Password updated"], 200);
                }

                return response(['message'=>"Password mismatch"], 422);


            }else{
                return response(['message'=>"Invalid current password"], 422);
            }

            
        }
    }

}