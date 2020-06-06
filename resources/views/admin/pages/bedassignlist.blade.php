@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')
    <div class="grid_10">
       <div style="height: 800px" class="box round first grid">
	       <a href="{{URL::to('bedassignadd')}}"><span class="btn btn-dark"> Add Bed Assign</span></a>
                <h2 style="text-align: center;">Bed Assign List</h2>
                <div class="block">
                  <table class="data display datatable" id="example">
					<thead>
            @if(Session::has('message'))
  <div data-alert class="alert-box">
       {{Session::get('message')}}
  </div>
  @endif
		<tr>
			<th>SL.NO</th>
              <th>Patient ID</th>
              <th>description</th>
              <th>assign Date</th>
              <th>discharge Date</th>
			  <th>Action</th>
			</tr>
		</thead>
		<tbody>

           @php $i=0; @endphp
            @foreach ($assignlist as $assign)
              @php $i++ @endphp
			  <tr class="odd gradeX">
			  <td>{{ $i}}</td>
              <td>{{$assign->patient_id}}</td>
              <td>{{$assign->description}}</td>
			  <td>{{$assign->assign_date}}</td>
			  <td>{{$assign->discharge_date}}</td>
	<td><a href="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> <a class="btn btn-xs btn-danger" onclick="return confirm('Are you sure to delte this row !')" href=""><i class="fa fa-trash"></i></a></td>
	</tr>
@endforeach
	</tbody>
	</table>
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
