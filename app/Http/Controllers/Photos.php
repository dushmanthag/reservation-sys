<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class Photos extends Controller
{
    //

    public function create(Request $request){
        
        $validator = Validator::make($request->all(), [
            'resource_type' => 'required|string|max:50',            
            'resource_id' => 'required',
            'photo'=>['required','mimes:jpg']
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        try{
            
            $photo = new \App\Models\Photo();

            $photo->resource_type = $request->resource_type;
            $photo->resource_id = $request->resource_id;
            $photo->save();

            if($request->hasFile('photo')){
                $uploadedFile = $request->file('photo');
                $filename = $photo->id.'.'.$uploadedFile->getClientOriginalExtension();
    
                if(Storage::disk('public')->putFileAs(
                    'photos',
                    $uploadedFile,
                    $filename
                  )){
                      $photo->name = $filename; 
                      $photo->save();
                  }
            }
            
            return response(['status'=>TRUE,'message'=>'Data updated'], 200);

        }catch(Exception $e){
            return response(['status'=>FALSE,'message'=>$e->getMessage()], 500);
        }   



    }
    
    
    public function show($id){
        
        
        
        $photo = \App\Models\Photo::find($id);
        
        if(!empty($photo)){
            
                $image_path = storage_path('app/public/photos/'.$photo->name);
        
                if(is_file($image_path)){
                    $image_path = storage_path('app/public/photos/'.$photo->name);
                }else{
                    $image_path = storage_path('app/public/no-image.jpg');
                }
            
                $mime_type = mime_content_type($image_path);
                header('Content-type: '.$mime_type);
                //header('Content-Disposition: attachment; filename="downloaded.pdf"');
                readfile($image_path);
        }
        
        return response(['status'=>TRUE,'message'=>'could not find image'], 404);
    }
    
    
    public function delete($id){
        
        
        
        $photo = \App\Models\Photo::find($id);
        
        if(!empty($photo)){
            
                $image_path = storage_path('app/public/photos/'.$photo->name);
        
                if(is_file($image_path)){
                    unlink($image_path);
                    $photo->delete();
                    return response(['status'=>TRUE,'message'=>'photo removed'], 200);
                }
                
                return response(['status'=>TRUE,'message'=>'could not remove image'], 404);
        }
        
        return response(['status'=>TRUE,'message'=>'could not find image'], 404);
    }
    
}
