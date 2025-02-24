<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\SearchItemRoomAminityResourceCollection;



class SearchItemRoomAminityResource extends JsonResource
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
                
                "id"=>$this->aminity->id,
                "name"=>$this->aminity->name,

                             
                ];
    }
}
