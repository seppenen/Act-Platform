
<%@ page import="model.Company"%>


<%@include file="header.jsp" %>

<%
Company company = null;
if( request.getAttribute("company")!=null){
	company = (Company)request.getAttribute("company");	
}
%><script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

   <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
    <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2 pl-3 pt-3 ">Edit company</h1>
           
          </div>
<div class=" mb-3 bg-white shadow">
          <form action="Servlet_newService" method="post" id="newProduct" class="   p-3  mx-auto">
  <div class=" form-group">
    <label for="title">Full Name</label>
    <input  class="form-control" name="name" id="name" value="${company.getName()}">
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
    <input class="form-control col-md-auto"  name="address" id="address" value="${company.getAddress()}">
  </div>
   </div>
    <div class=" form-group">
    <label for="availiblity">Open hours</label>
  
   <div class="form-row ">
    <div class="col-md-2  ">   
      <input class="form-control" name="from" id="from" placeholder="00.00">
    </div> 
    <label for=""> - </label>
    <div class="col-md-2">
      <input class="form-control"  name="to" id="to" placeholder="00.00">
    </div>
     <div class="col-md-auto">
   
    <select  class="form-control" name="day" id="day">
     
      <option value="mon">Monday</option>
      <option value="tue">Tuesday</option>
      <option value="wed">Wednesday</option>
      <option value="thu">Thursday</option>
      <option value="fri">Friday</option>
      <option value="sat">Saturday</option>
      <option value="sun">Sunday</option>
    </select>    </div>
    
         <div class="col-md-auto">
   
    <button class="btn btn-primary btn-md " id="addday" type="button"  >Add</button>
  </div>
    
    
  </div>  </div>
  
  <div class="form-group">
    <label >Description</label>
    <textarea class="form-control" name="description" id="description" rows="4"></textarea>
  </div>


  
 <input type="hidden" id="business_id" name="business_id" value="${company.getId()}">
<input type="hidden"  id="lat" name="lat" value="">
<input type="hidden" id="lng" name="lng" value="">
<input type="hidden" id="user" name="user" value="${session.getId()}">

  
</form>

 
  
    <div class="form-group">
  <button class="m-3 btn btn-primary btn-md " id="done" type="button"  >Submit</button>
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
  

    $("#spinner").hide();

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
    
 
    $('#done').click(function() {
    
    	const coords = geocode();
    	
    	coords.done(function(){
    		
    		
   			 console.log("coords.done");
   	 if($("#newProduct").valid()){
   		
	 
   		   $.ajax({
                  type: "POST",
                  url: "Servlet_newService",
                  data: $('#newProduct').serialize(),
                  success: function () {
                	  $('#newProduct').trigger("reset");
                	 $('#picture').html("<h6>Service successfully added</h6>");
                          
                  }
              }); 
   	 }
   	 });
    
    });
    
      $("#newProduct").validate({ 
    	  errorClass: 'errors',
          rules: {
          	
        	  company: { 
        		  required : true 
        		  },
          	
          	title: {
                  required: true,
                  minlength: 2
              },
              price: {
                  required: true,
                  number: true,
              },
              from: {
                  required: true
              },
              to: {
                  required: true
              },
              
              days: {
                  required: true
              },
              hours: {
                  required: true
              },
              description: {
                  required: true,
                  minlength: 2
              }
          },	
          messages: {
          	company: {     
  				required: "This field is required.",						
  			},
  			title: {
  				required: "This field is required.",
  				minlength: "Must be a number"
  			},
  			price: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			},
  			updateDescription: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			},	
  			tags: {
  				required: "This field is required.",
  						
  			}
  		}
  		
   
      });
      
      
     
      
    </script>

  </body>
</html>

