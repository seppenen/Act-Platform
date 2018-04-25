
<%@ page import="model.Company"%>


<%@include file="header.jsp" %>

<%
Company company = null;
if( request.getAttribute("company")!=null){
	company = (Company)request.getAttribute("company");	
}


%>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

   <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">

   
    <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom ">
            <h1 class="display-4 h2 pl-3 pt-3 ">${company.getName()}</h1>
           
          </div>
          
      
<div class="p-3 bg-white shadow">
  
     
   
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
    <input type="hidden" id="business_id" value="${company.getId()}">
   
    <button class="btn btn-primary btn-md " id="add_day" name="add_day" type="button" >Add</button>
  </div>
    
   
  </div>
 <div id="date_error" style="color:red;"></div>
      </div>
  
   <div id="openhours" class="form-group">


      </div>
    



  <p class="mb-3 " id="result"></p>
  
    <div class=" form-group">
  <button class=" btn btn-primary btn-md " id="submit" type="button" disabled >Next</button>
  
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
    

	
    <script>
    $("#submit").attr("disabled", false);
    
    function listaTunnit(){  
    	
    	  $.getJSON("Servlet_listatunnit?id=${company.getId()}", function(result){
    		
    	        $.each(result, function(i, field) { 
    	        	  
    	         $("#openhours").append("<div class='pt-3 form-row'><div class='col-md-2'>"+field.day+": </div><div class='col-md-2'> "+field.start+" - "+field.end+"</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+field.id+" id='delete' title="+field.day+" type='button' >Delete</button></div></div>");
    	     });
    	 });
    }

    function addError(data,day){
    
    	if(data!=1){
    		$("#date_error").text(day+ " already exist.");
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
                url: "Servlet_listatunnit",
                data: { from: from, to: to, day: day, business_id: business_id },
                success: function (data) {
              	      
  					addError(data, day);
  					$("#openhours").empty();
  					listaTunnit();

                }
            });
 	 }else{
 		 $("#date_error").text("Time is required.");
 	 }

   });
  
  $(document).on('click', '#delete', function(event) {
	
	  $("#openhours").empty(); 
		var id = $(this).val(); 
		
		
	 		   $.ajax({
	                type: "GET",
	                url: "Servlet_poistaTunti?id="+id,
	               
	                success: function (data) {
	  	
	  					listaTunnit();;
	                }
	            });
 });
		
  
  
    $("#spinner").hide();
    
    $(document).ready(function(){
   	 $('#to').timepicker({ timeFormat: 'HH:mm',  interval: 15  });
   	    $('#from').timepicker({ timeFormat: 'HH:mm' , interval: 15  });
   });
   
  

    $('#submit').click(function() {
    
    	document.location="newService.jsp";
    	
    });
    
  
    
    

      
     
      $(document).ready(function() {
    	  listaTunnit();
      });
      
      
      
    </script>

  </body>
</html>

