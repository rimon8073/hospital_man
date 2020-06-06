@include ('admin.layouts.header')
@include ('admin.layouts.sidebar')

<div class="grid_10">
            <div style="height: 900px" class="box round first grid">

          <h2 style="text-align: center;"> Category Info </h2>
               <div class="block copyblock">
   <form action="{{Route('categoryupdate')}}" method="post">
                 @csrf
                  <table class="form">
                    <tr>
                      <td>
                        <label>Category Name</label>
                      </td>
                    <td>
                          <input type="text" name="cat_name" value="" class="medium" required="required"/>
                      </td>
                    </tr>
                      <tr>
                      <td>
                          <label>Lab Type</label>
                      </td>
                      <td>
                          <input type="text" name="lab_test" value="" class="medium" required="required"/>
                      </td>
                      </tr>
              <tr>
                <td>
                    <label>Description</label>
                </td>
                    <td>
                        <input type="text" name="cat_description" value="" class="medium" required="required"/>
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
