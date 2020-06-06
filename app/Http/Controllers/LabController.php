<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class LabController extends Controller
{
  public function testadd(){
  $data=array();
  $data['categorylist'] = DB::table('lab_category')->get();
  return view('admin.pages.testadd',$data);
  }
  public function testlist(){
    $testlist = DB::table('lab_test')->get();
  return view('admin.pages.testlist',compact('testlist'));
  }
  public function testinsert(Request $request){
    $data = array();
    $time = time();
    $data['cat_name'] = $request->cat_name;
    $data['test_name'] = $request->test_name;
    $data['test_rate'] = $request->test_rate;
    $data['test_ref_fee'] = $request->test_ref_fee;
    $data['test_description'] = $request->test_description;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $result = DB::table('lab_test')->insert($data);
     return redirect()->route('testlist');
  }

  public function testedit($id){
    $test = DB::table('lab_test')->where('id',$id)->first();
    return view('admin.pages.testedit',compact('test'));
  }
  public function testupdate(Request $request, $id)
  {
    $data= array();
    $time = time();
    $data['cat_name'] = $request->cat_name;
    $data['test_name'] = $request->test_name;
    $data['test_rate'] = $request->test_rate;
    $data['test_ref_fee'] = $request->test_ref_fee;
    $data['test_description'] = $request->test_description;
    $data['created_at']=date("Y-m-d H:i:s",$time);
    $result = DB::table('lab_test')->where('id',$id)->update($data);
    return redirect()->route('testlist');
  }
  public function testdelete($id)
  {
    $testlist = DB::table('lab_test')->where('id',$id)->delete();
    //Set Message
       \Session::flash('message','Delete sucessfuly');
    return redirect()->route('testlist');
  }


  //category
  public function categoryadd(){
  return view('admin.pages.categoryadd');
  }
  public function categorylist(){
  $categorylist= DB::table('lab_category')->get();
  return view('admin.pages.categorylist',compact('categorylist'));
  }
  public function categoryinsert(Request $request){
    $data = array();
    $time = time();
    $data['cat_name'] = $request->cat_name;
    $data['lab_type'] = $request->lab_type;
    $data['cat_description'] = $request->cat_description;
    $data['status'] = $request->status;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $result = DB::table('lab_category')->insert($data);
    return redirect()->route('categorylist');
  }
  public function categoryedit($id){
    $category = DB::table('lab_category')->where('id',$id)->first();
    return view('admin.pages.categoryedit',compact('category'));
  }
  public function categoryupdate(Request $request, $id)
  {
    $data= array();
    $time = time();
    $data['cat_name'] = $request->cat_name;
    $data['lab_type'] = $request->lab_type;
    $data['cat_description'] = $request->cat_description;
    $data['status'] = $request->status;
    $data['created_at'] = date("Y-m-d H:i:s",$time);
    $result = DB::table('lab_category')->where('id',$id)->update($data);
    return redirect()->route('categorylist');
  }
  public function categorydelete($id)
  {
    $categorylist = DB::table('lab_category')->where('id',$id)->delete();
    //Set Message
       \Session::flash('message','Delete sucessfuly');
    return redirect()->route('categorylist');
  }

}
