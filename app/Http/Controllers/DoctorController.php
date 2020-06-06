<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class DoctorController extends Controller
{
  private $table = 'doctor';
  public function doctoradd()
  {
    $data['dept_list']=DB::table('department')->get();
      return view('admin.pages.doctoradd',$data);
  }

  public function doctorlist()
  {
      $doctorlist = DB::table($this->table)->get();
      return view('admin.pages.doctorlist',compact('doctorlist'));
  }

  public function doctoredit($id)
  {
    $data['dept_list']=DB::table('department')->get();
      $data['doctor'] = DB::table('doctor')->where('id',$id)->first();
      return view('admin.pages.doctoredit',$data);
  }


//patient inert delete update
  public function doctorinsert(Request $request)
  {
      $data = array();
      $time = time();
      $data['dname']=$request->dname;
      $data['email']=$request->email;
      $data['mobile']=$request->mobile;
      $data['gender']=$request->gender;
      $data['bloodGroup']=$request->bloodGroup;
      $data['address']=$request->address;
      $data['dob']=$request->dob;
      $data['degination']=$request->degination;
      $data['department']=$request->department;
      $data['biography']=$request->biography;
      $data['education']=$request->education;
      $image = $request->file('image');
      $data['created_at']=date("Y-m-d H:i:s",$time);

      if($image){
            $image_filename = $image->getClientOriginalName();
            $image->move(public_path('images/doctor'), $image_filename);
            $data['image']=$image_filename;
        }
        else{
            $image_filename="noimage.jpg";
        }

      $result = DB::table('doctor')->insert($data);
     
      return redirect()->route('doctorlist');
  }


  public function doctorupdate(Request $request,$id)
  {
    $data= array();
    $time = time();
    $data['dname']=$request->dname;
    $data['email']=$request->email;
    $data['mobile']=$request->mobile;
    $data['gender']=$request->gender;
    $data['bloodGroup']=$request->bloodGroup;
    $data['address']=$request->address;
    $data['dob']=$request->dob;
    $data['degination']=$request->degination;
    $data['department']=$request->department;
    $data['biography']=$request->biography;
    $data['education']=$request->education;
    $image =$request->file('image');
    $data['created_at']=date("Y-m-d H:i:s",$time);

    if($image){
          $image_filename = $image->getClientOriginalName();
          $image->move(public_path('images/doctor'), $image_filename);
          $data['image']=$image_filename;
      }
      else{
          $image_filename="noimage.jpg";
      }

    $doctor = DB::table('doctor')->where('id',$id)->update($data);
    //$result = DB::table('doctor')->insert($data['image_filename']);
    return redirect()->route('doctorlist');
  }


  public function doctordelete($id)
  {
    $doctorlist = DB::table('doctor')->where('id',$id)->delete();
    //Set Message
       \Session::flash('message','Delete sucessfuly');
    return redirect()->route('doctorlist');
  }


  public function doctorview($id){
    $result = DB::table('doctor')->where('id',$id)->first();
    return view('admin.pages.doctorview')->with('result',$result);
  }

}
