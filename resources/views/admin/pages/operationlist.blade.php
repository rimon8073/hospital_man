@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')

<div class="grid_10">
    <div style="height: 900px" class="box round first grid">
    <a href="{{URL::to('operationadd')}}"><span style="border-bottom: 2px solid black" class="btn btn-dark">Add Operation</span></a>
    
    <hr>
      <h2 style="text-align: center;background-color:white">Operation Report</h2>
    <div class="block">
 @if(Session::has('message'))
<div data-alert class="alert-box">
     {{Session::get('message')}}
</div>
@endif
        <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>SL.NO</th>
							<th>Title</th>
							<th>Description</th>
              <th>Doctor Name</th>
              <th>Action</th>
						</tr>
					</thead>
        
					<tbody>
            @php $i=0; @endphp
            @foreach ($operationlist as $operation)
              @php $i++ @endphp
			<tr class="odd gradeX">
							<td>{{ $i}}</td>
             				<td>{{ $operation->title }}</td>
							<td>{{ $operation->description }}</td>
							<td>{{ $operation->doctor_id }}</td>
            <td><a class="btn btn-xs btn-success" href="{{Route('operationview')}}/{{ $operation->oper_id }}"><i class="fa fa-eye"></i></a> <a class="btn btn-xs btn-primary" href="{{Route('operationedit')}}/{{$operation->oper_id}}"><i class="fa fa-edit"></i></a> <a class="btn btn-xs btn-danger" href="{{Route('operationdelete')}}/{{$operation->oper_id}}"><i class="fa fa-trash"></i></a></td>
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
