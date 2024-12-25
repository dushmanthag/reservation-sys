<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PhotoResource;

class SupplierBookingRoomResource extends JsonResource
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
                
                "description"=>$this->room->description,
                "numRooms"=>$this->numRooms,
                "photos"=>PhotoResource::collection($this->room->photos),                                
                
                ];
    }
}
