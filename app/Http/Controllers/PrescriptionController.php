<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class PrescriptionController extends Controller
{
   public function __construct()
    {
        $this->middleware('auth');
    }
    
  private $table='prescription_medicine';
  public function prescriptionadd(){
  
  $data = array();
  $data['t_name'] = DB::table('lab_test')->get();
  $data['m_name'] = DB::table('medicine')->get();
  $data['patient_code'] = DB::table('patient')->get();
    return view('admin.pages.prescriptionadd',$data);
  }
   public function prescriptionlist()
  {

      $prescriptionlistall = DB::table('prescription')->get();
      return view('admin.pages.prescriptionlist',compact('prescriptionlistall'));
  }
  public function prescriptioninsert(Request $request){
//$patient_name=DB::table('patient')->where('patient_code',$request->patient_id)->first();

    $data = array();
    $time = time();
    
    $data['patient_id'] = $request->patient_id;
    $data['pr_observation'] = $request->pr_observation;
    $data['status'] = $request->status;
    $data['created_at']=date("Y-m-d H:i:s",$time);
    $pr_id = DB::table('prescription')->insertGetId($data);  

    $medicine_id = $request->medicine_id;
    $douse = $request->douse;
    $douse_day = $request->douse_day;
    $instruction = $request->instruction;
    $medicine_arr = array();
    if(!empty($medicine_id)){
      foreach ($medicine_id as $key => $id) {
        $medicine_arr[] = array(
            'pr_id' => $pr_id,
            'medicine_id' => $id,
            'douse' => $douse[$key],
            'douse_day' => $douse_day[$key],
            'instruction' => $instruction[$key],
            'created_at' => date("Y-m-d H:i:s",$time)
        );
      }
       DB::table('prescription_medicine')->insert($medicine_arr);
    }

    $test_id = $request->test_id;
    $test_arr = array();

    if(!empty($test_id)){
      foreach ($test_id as $key => $id) {
        $test_arr[] = array(
            'pr_id'=>$pr_id,
            'test_id' => $test_id[$key],
            'created_at' => date("Y-m-d H:i:s",$time)
        );
      }
       DB::table('prescription_observation')->insert($test_arr); 
    }
    
    // $data['created_at'] = date("Y-m-d H:i:s",$time);
  
    return redirect()->route('prescriptionlist');
  }

  public function prescriptionview($pr_id){
      $data['prescription_info'] = DB::table('prescription')
            ->join('patient','patient.patient_code','=','prescription.patient_id')
            ->where('prescription.pr_id', $pr_id)
            ->first();

      $data['medicine_info'] = DB::table('prescription_medicine')
              ->join('medicine','medicine.id','=','prescription_medicine.medicine_id')
              ->where('prescription_medicine.pr_id',$pr_id)
              ->get();


      $data['test_info'] = DB::table('prescription_observation')
              ->join('lab_test','lab_test.id','=','prescription_observation.test_id')
              ->where('prescription_observation.pr_id',$pr_id)
              ->get();

    return view('admin.pages.prescriptionview',$data);
    
  }
  public function prescriptionedit($pr_id){
   
  $data['t_name'] = DB::table('lab_test')->get();
  $data['m_name'] = DB::table('medicine')->get();
     $data['prescription_info'] = DB::table('prescription')
            ->join('patient','patient.patient_code','=','prescription.patient_id')
            ->where('prescription.pr_id', $pr_id)
            ->first();
     $data['medicine_info'] = DB::table('prescription_medicine')
              ->join('medicine','medicine.id','=','prescription_medicine.medicine_id')
              ->where('prescription_medicine.pr_id',$pr_id)
              ->get();


      $data['test_info'] = DB::table('prescription_observation')
              ->join('lab_test','lab_test.id','=','prescription_observation.test_id')
              ->where('prescription_observation.pr_id',$pr_id)
              ->get();
   
    return view('admin.pages.prescriptionedit',$data);
  }
  public function prescriptionupdate(Request $request, $id)
  {
     $data = array();
    $time = time();
    
    $data['patient_id'] = $request->patient_id;
    $data['pr_observation'] = $request->pr_observation;
    $data['status'] = $request->status;
    $data['created_at']=date("Y-m-d H:i:s",$time);
    DB::table('prescription')->where('pr_id',$id)->update($data);  
    $pr_id=$id;
    $medicine_id = $request->medicine_id;
    $douse = $request->douse;
    $douse_day = $request->douse_day;
    $instruction = $request->instruction;
    $medicine_arr = array();
    
    if(!empty($medicine_id)){
      foreach ($medicine_id as $key => $id) {
        $medicine_arr[] = array(
            'pr_id' => $pr_id,
            'medicine_id' => $id,
            'douse' => $douse[$key],
            'douse_day' => $douse_day[$key],
            'instruction' => $instruction[$key],
            'created_at' => date("Y-m-d H:i:s",$time)
        );
      }
      DB::table('prescription_medicine')->where('pr_id',$pr_id)->delete();
       DB::table('prescription_medicine')->insert($medicine_arr);
    }
    
    $test_id = $request->test_id;
    $test_arr = array();

    if(!empty($test_id)){
      foreach ($test_id as $key => $id) {
        $test_arr[] = array(
            'pr_id'=>$pr_id,
            'test_id' => $test_id[$key],
            'created_at' => date("Y-m-d H:i:s",$time)
        );
      }
      DB::table('prescription_observation')->where('pr_id',$pr_id)->delete();
       DB::table('prescription_observation')->insert($test_arr); 
    }
    
    // $data['created_at'] = date("Y-m-d H:i:s",$time);
  
    return redirect()->route('prescriptionlist');
     
  }

  public function prescriptiondelete($pr_m_id)
  {
    $pres = DB::table('prescription_medicine')->where('pr_m_id',$pr_m_id)->delete();
    //Set Message
       \Session::flash('message','Delete sucessfuly');
    return redirect()->route('prescriptionlist');
  }
}
