@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')
        <div class="grid_10">
            <div style="height: 800px" class="box round first grid">
	             <a href="{{URL::to('invoiceadd')}}"><span class="btn btn-dark"> Add Invoic</span></a>
                <h2 style="text-align: center;">Invoice List</h2>
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
              <th>Total</th>
              <th>Vat</th>
              <th>Discount</th>
              <th>Grand Total</th>
              <th>Paid</th>
              <th>Due</th>
			  <th>Action</th>
						</tr>
					</thead>
					<tbody>

           @php $i=0; @endphp
            @foreach ($invoicelist as $invoice)
              @php $i++ @endphp
			<tr class="odd gradeX">
			<td>{{ $i}}</td>
              <td>{{$invoice->patient_id}}</td>
              <td>{{$invoice->total}}</td>
			  <td>{{$invoice->vat}}</td>
			  <td>{{$invoice->discount}}</td>
			  <td>{{$invoice->grand_total}}</td>
			  <td>{{$invoice->paid}}</td>
			  <td>{{$invoice->due}}</td>
	<td><a class="btn btn-xs btn-success" href=""><i class="fa fa-eye"></i></a> <a href="" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> <a class="btn btn-xs btn-danger" onclick="return confirm('Are you sure to delte this row !')" href="{{Route('invoicedelete')}}/{{ $invoice->id}}"><i class="fa fa-trash"></i></a> || <a class="btn btn-xs btn-danger" href="">Due</a></td>
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
