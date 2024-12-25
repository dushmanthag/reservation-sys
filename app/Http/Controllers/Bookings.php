<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

use App\Http\Resources\BookingCollection;
use App\Http\Resources\BookingResource;

class Bookings extends Controller
{
    //

    public function create(Request $request){
        
        $validator = Validator::make($request->all(), [
            'roomIds' => 'required',
            'numRooms'=>'required',
            'checkinDate'=>'required',
            'checkoutDate'=>'required',
            'numAdults'=>'required',
            'numChildren'=>'required',
            'numInfants'=>'required',
            'bookedByGuest'=>'required',
            'guestTitle'=>'required',
            'guestFirstName'=>'required',
            'guestLastName'=>'required',
            'guestEmail'=>'required',
            'guestPhone'=>'required',
            'guestDocumentNumber'=>'required',
            'guestDocumentType'=>'required'
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        try{
            
            $booking = new \App\Models\Booking();
            $booking->numRooms = $request->numRooms;
            $booking->checkinDate = $request->checkinDate;
            $booking->checkoutDate = $request->checkoutDate;
            $booking->numAdults = $request->numAdults;
            $booking->numChildren = $request->numChildren;
            $booking->numInfants = $request->numInfants;
            $booking->bookedByGuest = $request->bookedByGuest;
            $booking->guestTitle = $request->guestTitleID;
            $booking->guestFirstName = $request->guestFirstName;
            $booking->guestLastName = $request->guestLastName;
            $booking->guestEmail = $request->guestEmail;
            $booking->guestPhone = $request->guestPhone;
            $booking->guestDocumentNumber = $request->guestDocumentNumber;
            $booking->guestDocumentType = $request->guestDocumentType;
            
            $booking->bookingNumber = date("dmy");
            
            $user = \Auth::user();
            $booking->userID = 0;
            if(!empty($user)){
                $booking->userID = $user->id;   
            }
            
            $roomIds=$request->roomIds;
            
            

            $booking->save();
            $booking->bookingNumber = date("dmy").str_pad($booking->id, 8, "0", STR_PAD_LEFT);
            $booking->save();
            

            foreach($roomIds as $room){
                $bookingRoom = new \App\Models\BookingRoom();
                $bookingRoom->bookingID = $booking->id;
                $bookingRoom->roomID = $room['roomId'];
                $bookingRoom->numRooms = $room['numRooms'];
                $bookingRoom->save();
            }

            // Create the invoice for the booking

            if(!empty($booking->bookingNumber)){
                $invoice = $this->create_invoice($booking->id);
            }
            
            return response(['status'=>TRUE,'message'=>'Booking created',"data"=>["bookingNumber"=>$booking->bookingNumber,"invoice_id"=>$invoice->id]], 200);

        }catch(Exception $e){
            return response(['status'=>FALSE,'message'=>$e->getMessage()], 500);
        }   



    }
    
    
    
    
    public function listBookings(Request $request){
        
        $perpage = isset($request->perpage) ? $request->perpage : 50;
        
        $queryBooking = new \App\Models\Booking();
        $query = $queryBooking->newQuery();
        
        
        $data = $query->paginate($perpage);
        return (new BookingCollection($data))
                ->additional(['meta' => [
                    'key' => 'value',
                ]]);
        
    }
    
    private function create_invoice($booking_id){

            
            $booking = \App\Models\Booking::with(['rooms','rooms.room','rooms.room.property'])->find($booking_id);


            $invoice = new \App\Models\Invoice();
            $invoice->bookingId = $booking->id;
            $invoice->userId = $booking->userID;
            $invoice->billingFirstName = $booking->guestFirstName;
            $invoice->billingLastName = $booking->guestLastName;
            $invoice->billingPhoneNumber = $booking->guestPhone;
            $invoice->billingEmail = $booking->guestEmail;
            $invoice->InvoiceDate = date("Y-m-d");
            $invoice->dueDate = date("Y-m-d");
            $invoice->status = 0;
            $invoice->save();

            $invoice->invoiceNumber = date("dmy").str_pad($invoice->id, 5, "0", STR_PAD_LEFT);;
            $invoice->save();

            foreach($booking->rooms as $room){

                $room_cost = $room->room->estimate_cost($booking->checkinDate,
                                                        $booking->checkoutDate,
                                                        $booking->numAdults,
                                                        $booking->numChildren,
                                                        $booking->numInfants,
                                                        );


                 $invoice_line =  new \App\Models\InvoiceLine();
                 $invoice_line->invoiceId = $invoice->id;
                 $invoice_line->description = $room->room->property->name."/".$room->room->description." (".("A".$booking->numAdults).("C".$booking->numChildren).("I".$booking->numInfants).")";
                 $invoice_line->unitPrice	= $room_cost;
                 $invoice_line->qty	=  $room->numRooms;
                 $invoice_line->amount	= ($room_cost * $room->numRooms);
                 $invoice_line->save();                                           
                
            }

            $completed_invoice = \App\Models\Invoice::with(['lines'])->find($invoice->id);

            return $completed_invoice;
    }
    
    
    
}
