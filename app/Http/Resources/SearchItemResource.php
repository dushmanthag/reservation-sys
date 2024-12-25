<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PhotoResource;
use App\Http\Resources\SearchItemRoomCollection;

class SearchItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $price = $this->getMinimumPrice($request);
        $promoPrice = $this->getPromoPrice($request);
        
        return [
                
                "id"=>$this->id,
                "property_name"=>$this->name,
                "country"=>$this->country->name,
                "city"=>$this->city->name,
                "latitude"=> $this->locationLat,
                "longitude"=>$this->locationLon,
                "photos"=>PhotoResource::collection($this->photos),
                "promotion"=>$promoPrice < $price,
                "price"=>$price,
                "promo_price"=>$promoPrice,
                "rooms"=>new SearchItemRoomCollection($this->rooms)
                ];
    }
}
