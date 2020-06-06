@include ('front.layouts.header')

<div class="container-fluid">

<div class="row">
<img width="99.9%" src="{{asset('front/img/service_bg.jpg')}}">
</div>
</div>
<h3 class="text-center "><span style="border-bottom: 2px solid black;">Our Services</span> </h3>
<div  class="container">
  <div style="background-color: #092763;color: #FFF" class="row">
    <div style="padding: 25px" class="col border text-center">
    	<h3>Emegency</h3>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>

    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h3>BLOOD BANK</h3>

<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h3>AMBULANCE</h3>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>

    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h3>PHARMACY</h3>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>

    </div>
  </div>


  <div style="margin-top: 10px;background-color: #092763;color: #FFF" class="row">
    <div style="padding: 25px" class="col border text-center">
    	<h2> MEDICAL RECORDS</h2>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
  </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>BIRTH CERTIFICATE</h2>
<a href="{{Route('front_birth')}}"><button type="button" class="btn btn-secondary btn-lg btn-block"> View </button></a>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>DEATH CERTIFICATE</h2>
  <a href="{{Route('front_death')}}"><button type="button" class="btn btn-secondary btn-lg btn-block">View</button></a>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>CUSTOMER SERVICE</h2>
  <button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
  </div>

  <div style="margin-top: 10px;background-color: #092763;color: #FFF" class="row">
    <div style="padding: 25px" class="col border text-center">
    	<h2>CAFETERIA</h2>
  <button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>PRAYER ROOM</h2>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>Emegency</h2>
<button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
    <div style="padding: 25px" class="col border text-center">
    	<h2>Emegency</h2>
 <button type="button" style="" class="btn btn-secondary btn-lg btn-block">View</button>
    </div>
  </div>

</div>

@include ('front.layouts.footer')
