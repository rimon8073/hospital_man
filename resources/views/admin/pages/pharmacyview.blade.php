@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')

<div class="grid_10">
  <div style="height: 900px" class="box round first grid">
    <a href="{{URL::to('pharmacylist')}}"><span style="border-bottom: 2px solid black" class="btn btn-dark"> All pharmacy</span></a></h2>
  <h2 style="text-align: center;">Pharmacy List</h2>
<div class="block">
<form action="/" method="" enctype="multipart/form-data">
  @csrf
   <table class="form">
   <tr>
   <td>
   <label>Pharmacy Image</label>
 </td>
 <td>
   <img src="../images/employee/{{$result->emp_image}}" alt="employee Img" style="width:150px;height:120px;">
</td>
 </tr>
 <tr>
 <td>
 <label>User Role</label>
 </td>
 <td>
 <input type="text" name="user_role" readonly="readonly" value="{{ $result->user_role}}"  class="medium"/>
</td>
 </tr>
 <tr>
 <td>
 <label>Full Name</label>
</td>
 <td>
 <input type="text" name="emp_name" readonly="readonly" value="{{ $result->emp_name}}"  class="medium"/>
 </td>
 </tr>
 <tr>
 <td>
 <label>Email*</label>
</td>
<td>
<input type="text" name="emp_email" readonly="readonly" value="{{ $result->emp_email}}"  class="medium"/>
 </td>
</tr>
 <tr>
 <td>
 <label>Phone Number</label>
 </td>
 <td>
 <input type="text" name="emp_password" readonly="readonly" value="{{ $result->emp_password}}"  class="medium"/>
</td>
 </tr>
<tr>
<td>
 <label>Degination*</label>
 </td>
 <td>
<input type="text" name="emp_mobile" readonly="readonly" value="{{ $result->emp_mobile}}" class="medium"/>
</td>
   </tr>
<tr>
<td>
 <label>Department</label>
 </td>
 <td>
 <input type="text" name="emp_gender" readonly="readonly" value="{{ $result->emp_gender}}" class="medium"/>
 </td>
</tr>
 <tr>
 <td style="vertical-align: top; padding-top: 9px;">
 <label>Address</label>
 </td>
 <td>
<input type="text" name="emp_address" readonly="readonly" value="{{ $result->emp_address}}" class="medium"/>
 </td>
 </tr>
<tr>
 <td>
<label>Status</label>
 </td>
 <td>
     <input type="text" name="emp_status" readonly="readonly" value="{{ $result->emp_status}}" class="medium">
 </td>
 </tr>

<tr>
<td style="float:right"><a class="btn btn-info" href="{{ Route('pharmacylist')}}" >OK</a></td>
 </tr>
 </table>
 </form>
 </div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
	    setupLeftMenu();
	    $('.datatable').dataTable();
	    setSidebarHeight();
	});
</script>

@include ('admin.layouts.footer')
