<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::VERIFY;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'dob' => ['required', 'date', 'before:today'],
        ]);
        //'name' => ['required', 'string', 'max:255'],
        //'avatar' => ['required', 'image' ,'mimes:jpg,jpeg,png','max:1024'],
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        if ($data['role']=='Alumno') {
            return User::create([
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'dob' => date('Y-m-d', strtotime($data['dob'])),
                'status' => true,
            ])->assignRole($data['role']);
        }
        else if ($data['role']=='Instructor') {
            return User::create([
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'dob' => date('Y-m-d', strtotime($data['dob'])),
            ])->assignRole($data['role']);
        }
        else {
            return User::create([
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'dob' => date('Y-m-d', strtotime($data['dob'])),
            ]);
        }
        //'name' => $data['name'],
        //'avatar' => "/images/" . $avatarName,
    }
}
