@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')

<div class="grid_10">
    <div class="box round first grid">
        <h2>Update Patient Info (Indoor)</h2>
        <div class="block">

          <form action="{{Route('patientupdate')}}/{{ $patient->id}}" method="post" name="id" >
            @csrf
             <table class="form">
                 <tr>
                 <td>
                 <label>Full Name</label>
             </td>
               <td>
                 <input type="text" name="name" value="{{ $patient->name}}"  class="medium"/>
             </td>
             </tr>
                 <tr>
                 <td>
                 <label>Email*</label>
             </td>
             <td>
                 <input type="text" name="email" value="{{ $patient->email}}" class="medium"/>
             </td>
                 </tr>
                 <tr>
                 <td>
                 <label>Mobile</label>
             </td>
             <td>
                 <input type="text" name="mobile" value="{{ $patient->mobile }}" class="medium"/>
             </td>
                 </tr>
                 <tr>
                 <td>
                 <label>Address</label>
             </td>
             <td>
                 <input type="text" name="address" value="{{ $patient->address }}" class="medium"/>
             </td>
                 </tr>

                <tr>
             <td>
                 <label>Gender</label>
             </td>
             <td>
               <input Type="text" name="gender" value="{{ $patient->gender}}"/>
             </td>
         </tr>

         <tr>
             <td>
                 <label>Date of Birth</label>
             </td>
             <td>
                 <input type="date" name="dob" value="{{ $patient->dob}}"/>
             </td>
         </tr>
         <tr>
             <td>
                 <label>Blood Group</label>
             </td>
             <td>
              <input type="text" name="bloodGroup" value="{{ $patient->bloodGroup}}"/>
             </td>
         </tr>
         <tr>
             <td>
                 <label>Reference Type</label>
             </td>
             <td>
                <input type="text" name="referencetype" value="{{ $patient->referencetype}}"/>
             </td>
         </tr>
         <tr>
             <td>
                 <label>Reference</label>
             </td>
             <td>
                <input name="reference" value="{{ $patient->reference}}"/>
             </td>
         </tr>
         <tr>
             <td>
                 <label>Type</label>
             </td>
             <td>
                <input type="text" name="type" value="{{ $patient->type}}"/>
             </td>
         </tr>
              <tr>
                     <td>
                         <input type="submit" name="submit" Value="Update" class="btn btn-success"/>
                     </td>
                 </tr>
             </table>
             </form>

        </div>
    </div>
</div>

@include ('admin.layouts.footer')
