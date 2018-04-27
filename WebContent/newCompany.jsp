
<%@ page import="model.Company"%>


<%@include file="header.jsp" %>



<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

   <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">

   
    <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom ">
            <h1 class="display-4 h2 pl-3 pt-3 ">New company</h1>
           
          </div>
          
   
<div class=" mb-3 bg-white shadow">
  
       <form action="Servlet_NewCompany" method="post" id="newCompany" class="   p-3  mx-auto">
  <div class=" form-group">
    <label for="title">Full Name</label>
    <input  class="form-control" name="name" id="name" value="">
  </div>
  <div class=" form-group">
    <label for="title">Alias</label>
    <input  class="form-control" name="alias" id="alias" value="">
  </div>
  <div class=" form-group">
    <label for="title">Phone</label>
    <input  class="form-control" name="phone" id="phone" value="">
  </div>
    <div class=" form-group ">
    <label for="price">Address</label>
     <div class="autocomplete">
    <input class="form-control col-md-auto"  name="address" id="address" value="">
  </div>
   </div>

   <div class=" form-group">
    <label for="availiblity">Open hours</label>
  
   <div class="form-row ">
    <div class="col-md-2  ">   
      <input class="form-control" name="from" id="from" placeholder="From">
    </div> 
    <label for=""> - </label>
    <div class="col-md-2">
      <input class="form-control"  name="to" id="to" placeholder="To" >
    </div>
     <div class="col-md-auto">
   
    <select  class="form-control" name="day" id="day">
     
      <option value="Monday">Monday</option>
      <option value="Tuesday">Tuesday</option>
      <option value="Wednesday">Wednesday</option>
      <option value="Thursday">Thursday</option>
      <option value="Friday">Friday</option>
      <option value="Saturday">Saturday</option>
      <option value="Sunday">Sunday</option>
    </select>    </div>
    
         <div class="col-md-auto">
      <input type="hidden" id="business_id" name="business_id" value="">
   
    <button class="btn btn-primary btn-md " id="add_day" name="add_day" type="button" >Add</button>
  </div>
    
   
  </div>
 <div id="date_error" style="color:red;"></div>
      </div>
  
   <div id="openhours" class="form-group">


      </div>
    
  <div class="form-group">
    <label >Description</label>
    <textarea class="form-control" name="description" id="description" rows="4"></textarea>
  </div>


 <input type="hidden"  id="lat" name="lat" value="">
<input type="hidden" id="lng" name="lng" value="">


  
</form>

  <p class="mb-3 pl-3" id="result"></p>
  
    <div class="form-group">
  <button class="m-3 btn btn-primary btn-md " id="submit" type="button"  >Save</button>
<img src="images/spinner.gif" class="mx-auto " id="spinner">
 </div>
</div>   
</div> 
  </div>
        </main>
      </div>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    

	
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYGmROPS0aVzBLHXoT1zWHEpIipah9w2A&libraries=places&callback=initAutocomplete" async defer></script>
    <script>
   
 
    $(document).ready(function() {
  	  listaTunnit();
  	getId();
  	 $('#to').timepicker({ timeFormat: 'HH:mm',  interval: 15  });
	    $('#from').timepicker({ timeFormat: 'HH:mm' , interval: 15  });
    });
  
    function checkId(){
    	
    	if($("#business_id").val()==""){
    		
    		getId();
    	}
    }
    function getId(){
    	
    	 $.ajax({
    	        type: "GET",
    	        url: "Servlet_createId?param=0",
    	        success: function (data) {
    	        	$("#business_id").val(data.trim());
    	        	
    	        	checkId();
    	        }
    	    });
    	 
    	 
    	
    }
   
    
    $("#spinner").hide();
    
    function listaTunnit(){  
    	
  	  $.getJSON("Servlet_listatunnit?id="+$("#service_id").val()+"&param=service_id&table=hours_service", function(result){
  		
  	        $.each(result, function(i, field) { 
  	        	  
  	         $("#openhours").append("<div id='openhour' class='pt-3 form-row'><div class='col-md-2'>"+field.day+": </div><div class='col-md-2'> "+field.start+" - "+field.end+"</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+field.id+" id='delete' title="+field.day+" type='button' disabled >Delete</button></div></div>");
  	     });
  	 });
  }
  
function addError(data,day){
      
  	if(data.length=="0"){
  		$("#date_error").text(day+ " already exist.");
  	}else{
  		
				$("#openhours").append("<div id='openhour' class='pt-3 form-row'><div class='col-md-2'>"+$("#day").val()+": </div><div class='col-md-2'> "+$("#from").val()+" - "+$("#to").val()+"</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+data+" id='delete' title="+$("#day").val()+" type='button' enabled  >Delete</button></div></div>");

  	}
  	
  	
  }
  
$("#add_day").click(function() {
	  $("#date_error").text("");
	 
	
	var from =  $("#from").val();
	var to =  $("#to").val();
	var day =  $("#day").val();
	var business_id =  $("#business_id").val();
 	 if(from!="" && to!=""){
 		
 		   $.ajax({
                type: "POST",
                url: "Servlet_listatunnit?s=1&temp=1",
                data: { from: from, to: to, day: day, id: business_id },
                success: function (data) {
                	console.log(data.trim().length);
  					addError(data.trim(), day);
  					
  					
                }
            });
 	 }else{
 		 $("#date_error").text("Time is required.");
 	 }

   });
   
$(document).on('click', '#delete', function(event) {
	
	  
	var id = $(this).val();
	$(this).parents('#openhour').remove();
	
	
 		   $.ajax({
                type: "GET",
                url: "Servlet_poistaTunti?s=1&id="+id,
               
                success: function (data) {
  	

                }
            });
 		   
});

    function initAutocomplete() {
    
	new google.maps.places.Autocomplete((document.getElementById('address'))); 
     
    }
    

    function geocode(){
    	
    	var a=$.Deferred();
   
    	var location=$('#address').val(); 	
    	
    	$.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='+location+'&key=AIzaSyDYGmROPS0aVzBLHXoT1zWHEpIipah9w2A', function(response){
    		
    	var lat = response.results[0].geometry.location.lat;
    	var lng = response.results[0].geometry.location.lng;
    	
    	console.log(lat+ " "+lng);
    	
    	if(lat!="" && lng!=""){    		
    	
    	$("#lat").val(lat);
    	$("#lng").val(lng);

    	a.resolve();
    	
    	}else{
    		
    		geocode();
    		
    	}
    	})

    	return a;
    	
    	}
    
    
   
 $("#spinner").hide();
    
    $(document).ready(function(){
   	 $('#to').timepicker({ timeFormat: 'HH:mm',  interval: 15  });
   	    $('#from').timepicker({ timeFormat: 'HH:mm' , interval: 15  });
   });
   
    
    $('#submit').click(function() {
    
	
 
   	 if($("#newCompany").valid()){
		
   		 const coords = geocode();
    	
    	coords.done(function(){
    		console.log("coords.done");
   		   $.ajax({
                  type: "POST",
                  url: "Servlet_NewCompany",
                  data: $('#newCompany').serialize(),
                  success: function (data) {
                	 console.log(data);
                	  $("#result").text("Company added successfully!");
                	   
                	 
                	  
                	  
                  }
              }); 
   	 });
    	
    	}
   	
    
    });
    
  
    
    
    
      $("#newCompany").validate({ 
    	  errorClass: 'errors',
          rules: {
          	
        	  name: { 
        		  required : true 
        		  },
          	
          	alias: {
                  required: true,
                  minlength: 2
              },
              phone: {
                  required: true,
                  number: true,
              },
              
              address: {
                  required: true,
                  
              },
            
              
              description: {
                  required: true,
                  minlength: 2
              }
          },	
          messages: {
          	name: {     
  				required: "This field is required.",						
  			},
  			alias: {
  				required: "This field is required.",
  				
  			},
  			phone: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			},
  			address: {
  				required: "This field is required.",
  								
  			},
  			description: {
  				required: "This field is required.",
  								
  			}
  		}
  		
   
      });
      
  
      
      
      
    </script>

  </body>
</html>

