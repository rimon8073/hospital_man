<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class BedController extends Controller
{
   public function bedadd(){
   	return view('admin.pages.bedadd');
   } 
   public function bedlist(){
   	$bedlist = DB::table('hm_bed')->get();
   	return view('admin.pages.bedlist',compact('bedlist'));
   }
   public function bedinsert(Request $request){
   	$data = array();
    $time = time();
    $data['bed_type'] = $request->bed_type;
    $data['description'] = $request->description;
    $data['limit'] = $request->limit;
    $data['charge'] = $request->charge;
    $data['status'] = $request->status;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $result = DB::table('hm_bed')->insert($data);
    return redirect()->route('bedlist');
   }

   public function bededit($id){
      $bed_edit = DB::table('hm_bed')->where('id',$id)->first();
      return view('admin.pages.bededit',compact('bed_edit'));
   }
   public function bedupdate(Request $request, $id){
    $data = array();
    $time = time();
    $data['bed_type'] = $request->bed_type;
    $data['description'] = $request->description;
    $data['limit'] = $request->limit;
    $data['charge'] = $request->charge;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $bed_edit = DB::table('hm_bed')->where('id',$id)->update($data);
    return redirect()->route('bedlist');
   }
   public function beddelete($id){
     $beddel = DB::table('hm_bed')->where('id',$id)->delete();
    //Set Message
       \Session::flash('message',' Bed Delete sucessfully');
    return redirect()->route('bedlist');
   }


   public function bedassignadd(){
    $data['patient_id']=DB::table('patient')->get();
    $data['bed_typelist']=DB::table('hm_bed')->get();
   	return view('admin.pages.bedassignadd',$data);
   }

   public function bedassigninsert(Request $request){
   	$data = array();
    $time = time();
    $data['patient_id'] = $request->patient_id;
    $data['description'] = $request->description;
    $data['discharge_date'] = $request->discharge_date;
    $data['assign_date'] = $request->assign_date;
    $data['status'] = $request->status;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $result = DB::table('bed_assign')->insert($data);
    return redirect()->route('bedassignlist');
   }
   public function bedassignlist(){
   	$assignlist = DB::table('bed_assign')->get();
   	return view('admin.pages.bedassignlist',compact('assignlist'));
   }
   
}
