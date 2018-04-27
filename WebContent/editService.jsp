<%@include file="header.jsp" %>
<%@ page import="model.Services"%>

<%
Services service = null;
if( request.getAttribute("service")!=null){
	service = (Services)request.getAttribute("service");	
	
	
}


%>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
               <h1 class="display-4 h2 pl-3 pt-3">Edit service</h1>
           
          </div>
<div class=" mb-3 bg-white shadow">
          <form action="Servlet_newService" method="post" id="newProduct" class="p-3  mx-auto">
  <div class=" form-group">
    <label for="title">Title</label>
    <input  class="form-control" name="title" id="title" value="${service.getTitle()}">
  </div>
    <div class=" form-group ">
    <label for="price">Price</label>
    <input  class="form-control col-md-auto"  name="price" id="price" value="${service.getPrice()}">
  </div>
    <div class=" form-group">
    <label for="availiblity">Available</label>
  
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
    
   
    <button class="btn btn-primary btn-md " id="add_day" name="add_day" type="button" >Add</button>
  </div>
    
   
  </div> 
  <div id="date_error" style="color:red;"></div>
  
   </div>
   
   <div id="openhours" class="form-group">


      </div>
      

  <div class="form-group">
    <label for="">Availability / hour</label>
    <select  class="form-control" name="hour" id="hour">
      <option id="default" value="${service.getHour()}">${service.getHour()}</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
  </div>
  <div class="form-group">
    <label >Description</label>
    <textarea class="form-control" name="description" id="description" rows="4">${service.getDescription()}</textarea>
  </div>


  
 <input type="hidden" id="service_id" name="service_id" value="${service.getId()}">
 <input type="hidden" id="image" name="image" value="">

  
</form>
<p><span id="imagediv" class="mb-3 pl-3" > </span>
<img src="images/spinner.gif" class="mx-auto " id="spinner"> </p>
     
     <label class="mb-3 pl-3" for="exampleFormControlTextarea1">Picture size 841x120</label>

   
  <form action="Servlet_upload" enctype="multipart/form-data" method="post" id="kuva"  class="was-validated">
 



  <div class="input-group p-3">

  <div class="custom-file">
        <input type="file" class="custom-file-input" name="uploadFile" id="upLoadFile" required />
        <label class="custom-file-label" for="uploadFile">Choose file</label>
        </div> 
        <div class="input-group-append">
        <input class="btn btn-primary" type="button" id="uploadbtn" value="Upload" onclick="lataa()" disabled/> 
        
 </div></div> 
      <label class="mb-3 pl-3" id="picture"></label>
 
 </form>
  
    <div class="form-group">
  <button class="m-3 btn btn-primary btn-md " id="done" onclick="submit()"type="button"  >Save</button>

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
    
    function Image(){
    	
    	
    if ("${service.getImage()}"!=""){
    	$("#image").val("${service.getImage()}")
    	$("#imagediv").append("<img style='width:50%;' src='images/uploads/${service.getImage()}'>   <input class='ml-3 btn btn-sm btn-primary' id='poista' type='button' value='Delete'  />");
    }else{
    	 $("#done").prop('disabled', true);

    	 $("#uploadbtn").prop('disabled', false);
    }
    }
    
    $("#hour").change(function(){	
  	  $("#hour option[id='default']").remove();
  	 		
    });
    $(document).ready(function(){
    	  Image();
    	 $('#to').timepicker({ timeFormat: 'HH:mm',  interval: 15  });
    	    $('#from').timepicker({ timeFormat: 'HH:mm' , interval: 15  });
    	    
    	    
 		
    	      
    	    
    });
    
   
    
    function listaTunnit(){  
    	
    	  $.getJSON("Servlet_listatunnit?id=${service.getId()}&param=service_id&table=hours_service", function(result){
  		
  	        $.each(result, function(i, field) { 
  	        	  
  	         $("#openhours").append("<div  id='openhour' class='pt-3 form-row'><div class='col-md-2'>"+field.day+": </div><div class='col-md-2'> "+field.start+" - "+field.end+"</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+field.id+" id='delete' title="+field.day+" type='button' >Delete</button></div></div>");
  	     });
  	 });
  }
   
	$("#spinner").hide();

	  $(document).on('click', '#delete', function(event) {
			
	var id = $(this).val(); 
			$(this).parents('#openhour').remove();
			
		 		   $.ajax({
		                type: "GET",
		                url: "Servlet_poistaTunti?s=0&id="+id,
		               
		                success: function (data) {
		  	
		  				
		                }
		            });
	 });
			
	  function addError(data,day){
		    
	    	if(data.length=="0"){
	    		$("#date_error").text(day+ " already exist.");
	    	}else{
	    		
	    		console.log(data);
					$("#openhours").append("<div id='openhour' class='pt-3 form-row'><div class='col-md-2'>"+$("#day").val()+": </div><div class='col-md-2'> "+$("#from").val()+" - "+$("#to").val()+"</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+data+" id='delete' title="+$("#day").val()+" type='button' >Delete</button></div></div>");

	    	}
	    	
	    	
	    }
	  
	    $(document).on('click', '#poista', function(event) {
	    	
	    	
	    	 $.ajax({
	                type: "POST",
	                url: "Servlet_poistaKuva?id=${service.getId()}",
	               
	                success: function (data) {
	                	$("#imagediv").empty();
	                	$("#image").val("");
	                 	 $("#done").prop('disabled', true);

	  					
	                }
	            });
	    	 $("#uploadbtn").prop('disabled', false);
	    	
	    	
	    });
	    
	  $("#add_day").click(function() {
		  $("#date_error").text("");
		 
		
		var from =  $("#from").val();
		var to =  $("#to").val();
		var day =  $("#day").val();
		var service_id =  $("#service_id").val();
	 	 if(from!="" && to!=""){
	 		
	 		   $.ajax({
	                type: "POST",
	                url: "Servlet_listatunnit?s=0&temp=0",
	                data: { from: from, to: to, day: day, id: service_id },
	                success: function (data) {
	              	      
	                	console.log(data.trim());
	  					addError(data.trim(), day);
	  					

	                }
	            });
	 	 }else{
	 		 $("#date_error").text("Time is required.");
	 	 }

	   });
   
      
  
      
      
      
      function submit() {
    	 if(  $("#newProduct").valid()){
    		 
    		   $.ajax({
                   type: "POST",
                   url: "Servlet_editService",
                   data: $('#newProduct').serialize(),
                   success: function () {
                 	  $('#newProduct').trigger("reset");
                 	
                 	
                    
     
                   }
               });
    	 }
    	  
      };
     
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
             
              hour: {
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
  			hour: {
  				required: "This field is required.",
  							
  			},
  			
  			updateDescription: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			}
  		}
  		
   
      });
      
      
      
      
      function lataa(){	
    	  
    	  console.log("lataa()")
  		var paatteet = ["png", "jpg", "gif","jpeg"]; 
  		var paate = document.getElementById("upLoadFile").value.split(".")[1];
  		var kelvollinen = 0;
  		
  		for(var i=0;i<paatteet.length;i++){
  			if(paatteet[i]==paate.toLowerCase()){
  				console.log("kelvollinen");
  				kelvollinen=1;
  				break;
  			}else{
  				$('#picture').html("<span style='color:red'>Wrong format</span>");
  			}
  		}		
  		if(kelvollinen==1&&document.getElementById("upLoadFile").value.length>0){
  		 
  			event.stopPropagation();
          event.preventDefault();
          var files = files;
          var form = document.getElementById('kuva');
          var data = new FormData(form);
          postFilesData(data);
  			
  			$("#spinner").show();
  			
  		  function postFilesData(data) {
              $.ajax({
                  url :  'Servlet_upload',
                  type : 'POST',
                  data : data,
                  cache : false,
                 
                  processData : false,
                  contentType : false,
                  success : function(data) {
                	  $("#done").prop('disabled', false);
                    
                    $('#picture').html("Loaded file: "+data);
                    $('#image').val(data.trim());
             		$("#spinner").show();

                    $("#uploadbtn").prop('disabled', true);
                    submit();
			setTimeout(function(){
            	 $("#done").prop('disabled', false);

   					 $("#imagediv").append("<img style='width:50%; height:120px;' src='images/uploads/"+data.trim()+"'>   <input class='ml-3 btn btn-sm btn-primary' id='poista' type='button' value='Delete'  />");

                 		$("#spinner").hide();
                 		}, 2000);
                 		
                 		
                   
                    
                  },
                  error : function(jqXHR, textStatus, errorThrown) {
                      alert('ERRORS: ' + textStatus);
                  }
              });
              
              
          }
  		}
  		$("#spinner").hide();
  		
  	}
      listaTunnit();
      
    </script>

  </body>
</html>

