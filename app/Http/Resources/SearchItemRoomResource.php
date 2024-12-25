<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PhotoResource;
use App\Http\Resources\SearchItemRoomAminityResourceCollection;

class SearchItemRoomResource extends JsonResource
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
                "description"=>$this->description,
                "photos"=>PhotoResource::collection($this->photos),
                "roomTypeID"=>$this->roomTypeID,
                "type"=>$this->type,
                "numPersons"=>$this->numPersons,
                "aminities"=>new SearchItemRoomAminityResourceCollection($this->aminities)               
                ];
    }
}
