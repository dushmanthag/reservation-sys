<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;

class ApiAuthController extends Controller
{
    public function register (Request $request) {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $request['password']=Hash::make($request['password']);
        $request['remember_token'] = Str::random(10);
        $user = \App\Models\User::create($request->toArray());
        $token = $user->createToken('Laravel Password Grant Client')->accessToken;
        $response = ['token' => $token];
        return response($response, 200);
    }

    public function login (Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $user = \App\Models\User::where('email', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                $response = ['token' => $token];
                return response($response, 200);
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
    }
    
    public function change_password(Request $request) {
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => 'required|string|min:6|same:confirm_password',
            'confirm_password' => 'required|string|min:6',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        
        $user = \Auth::user();
        
        if ($user) {
            if (Hash::check($request->current_password, $user->password)) {
                //$token = $user->createToken('Laravel Password Grant Client')->accessToken;
                //$response = ['token' => $token];
                
                $user->password = Hash::make($request->password);
                $user->save();
                
                $response = ["message" => "Password changed!"];
                return response($response, 200);
            } else {
                $response = ["message" => "Current password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
    }


    public function recover(Request $request) {
        
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255'
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $user = \App\Models\User::where('email', $request->email)->first();
        
        if ($user) {
            
            // Create random password;
            
            $password = $this->generatePassword(10);
            
            
            $user->password = Hash::make($password);
            $user->save();
            
           $result = Mail::send('kh.auth.recovery', ['user' => $user, 'password' => $password], function ($m) use ($user) {
                $m->from('reservations@kavianlanka.com', 'Daleng Team');
                $m->to($user->email)->subject("Password Recovery");
                
                
            });
                
            
            $response = ["message" => "New password sent"];
            return response($response, 200);
                
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
    }
    
    private function generatePassword($n) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomString = '';
     
        for ($i = 0; $i < $n; $i++) {
            $index = rand(0, strlen($characters) - 1);
            $randomString .= $characters[$index];
        }
     
        return $randomString;
    }

    public function logout (Request $request) {
        if (\Auth::check()) {
            \Auth::user()->token()->revoke();;
            $response = ["message" =>'User logged out'];
            return response($response, 200);
        }else{
            $response = ["message" =>'Invalid token'];
            return response($response, 403);
        }
    }

    public function profile (Request $request) {
        if (\Auth::check()) {
            //\Auth::user()->token()->revoke();
                        
            return response(\Auth::user(), 200);
        }else{
            $response = ["message" =>'Invalid token'];
            return response($response, 403);
        }
    }

    
}
