<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\SupplierBookingRoomResource;

class SupplierBookingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        
        
        return [
                
                "id"=>$this->id,                
                "checkinDate"=>$this->checkinDate,
                "checkoutDate"=>$this->checkoutDate,
                "numAdults"=> $this->numAdults,
                "numChildren"=>$this->numChildren,
                "numInfants"=>$this->numInfants,
                "bookedByGuest"=>$this->bookedByGuest,
                "guestTitle"=>$this->guestTitle,
                "guestFirstName"=>$this->guestFirstName,
                "guestLastName"=>$this->guestLastName,
                "guestEmail"=>$this->guestEmail,
                "guestPhone"=>$this->guestPhone,
                "guestDocumentNumber"=>$this->guestDocumentNumber,
                "guestDocumentType"=>$this->guestDocumentType,
                "status"=>$this->status,
                "statusCode"=>$this->status_code,
                "property"=>$this->rooms[0]->room->property,
                "rooms"=>SupplierBookingRoomResource::collection($this->rooms),
                "billed_amount"=>2000
                ];
    }
}
