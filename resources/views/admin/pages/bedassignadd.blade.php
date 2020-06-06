@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')
<div class="grid_10">
<div style="height:900px" class="box round first grid">
<h2 style="text-align: center;background-color:white"> Bed Assign Info</h2>
    <a href="{{URL::to('bedassignlist')}}"><span class="btn btn-dark">All Bed Assign</span></a>
    @if(Session::has('message'))
     <div data-alert class="alert-box">
     {{Session::get('message')}}
     </div>
     @endif 
<div class="block copyblock">
    <form action="{{Route('bedassigninsert')}}" method="post" enctype="">
       @csrf
    <table class="form">
<tr>
        <td>
        <label>Patient ID</label>
    </td>
      <td>
    <select  name="patient_id">
          <option>Select patient name</option>
  @foreach($patient_id as $patient)
          
          <option value="{{$patient->id}}">
            {{$patient->patient_code}} ({{$patient->name}})
          </option>
          @endforeach
        </select>
      </td>
        </tr>
 
  <tr>
      <td>
        <label>Bed Type</label>
      </td>
      <td>
          <select name="bed_type">
              <option>Select Option</option>
              @foreach($bed_typelist as $type)
              <option value="{{$type->id}}">{{$type->bed_type}}</option>
              
              @endforeach
          </select>
      </td>
  </tr>
  <tr>
    <td>
      <label>Day</label>
    </td>
    <td>
      <input type="text" name="assign_date">
    </td>
  </tr>
  <!-- <tr>
        <td>
        <label>Assign Date</label>
    </td>
      <td>
 <input type="date" name="assign_date" class="" required="required"/>
   </td>
 </tr>
 
 <tr>
    <td>
   <label>Discharge Date</label>
    </td>
   <td>
    <input type="date" name="discharge_date" class="" required="required"/>
   </td>
   </tr> -->
 
        <tr>
        <td style="vertical-align: top; padding-top: 9px;">
      <label>Description</label>
        </td>
        <td>
          <textarea class="tinymce" style="width:250px;height:50px" name="description" required="required" ></textarea>
        </td>
      </tr>

  </table>
  <div class="form-check-inline">
 <label>Status</label>
 </div>
 <div class="form-check-inline">
       <label class="form-check-label" for="radio1">
         <input type="radio" class="form-check-input" id="radio1" name="status" value="1" checked>Complete
       </label>
     </div>

 <div class="form-check-inline">
 <label class="form-check-label" for="radio2">
 <input type="radio" class="form-check-input" id="radio2" name="status" value="0">Incompelete
 </label>
 </div>
 <div style="float:right" class="">
 <input type="submit" name="submit" Value="submit" class="btn btn-success"/>
 <input type="reset" name="reset" Value="Reset" class="btn btn-success"/>
 </div>
     </form>
    </div>
   </div>
  </div>

  <script>
    
  </script>

@include ('admin.layouts.footer')
