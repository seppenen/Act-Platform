<%@include file="header.jsp" %>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

<script>


  $(document).ready(function() {

    $('#calendar').fullCalendar({
    themeSystem: 'bootstrap4',
      header: {
    	  left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay,listMonth'
      },
      firstDay: 1,
      
      editable: true,
      
      navLinks: true, // can click day/week names to navigate views
      eventLimit: true, // allow "more" link when too many events
      eventColor: '#4682B4',
      eventTextColor: 'white',
      events: {
        url: 'Servlet_calendar',
       
        error: function() {
         
        }
      },
      loading: function(bool) {
        $('#loading').toggle(bool);
      },
      
      dayClick: function(date) {
		var clickDate=date.format();
    	    console.log('Clicked on: ' + clickDate);
    	    $("#day").val(clickDate);
    	    $("#modal").modal();
    	    $(".modal-title").text("New record "+ clickDate);


    	  }
    	  
 
    });

  });


</script>


        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="display-4 h2 pt-3 pl-3">Calendar</h1>
           
          </div>

          <div class="shadow bg-white m-2 p-2  " id='calendar'></div>
       
  </div>
        </main>
      </div>
      
<div class="modal fade" id="modal"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
        <form action="Servlet_tilaukset" method="post" id="newOrder" >
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name:</label>
            <input type="text" class="form-control" name="name" id="name">
          </div>
          
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">Phone:</label>
            <input type="text" class="form-control" name ="phone"id="phone">
          </div>
          
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Company:</label>
<select name="company" id="company" class="form-control" >
      
    </select>            
          </div>
          
            <div class="form-group">
            <label for="recipient-name" class="col-form-label">Service:</label>
<select name="service" id="service" class="form-control" >
      
    </select>            
          </div>
          
          <div class="form-group  ">
        <label for="recipient-name" class="col-form-label">Time:</label>
          <div class="form-row ">
					<div class="col-md-auto">

					<select class="form-control" name="starthour" id="starthour">

						
					
					</select>
				</div>
				
				<div class="col-md-auto">

					<select class="form-control" name="min" id="min">

						<option value="00">00</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="45">45</option>
						
					</select>
				</div>
				
				<div class="col-md-auto">

					<select class="form-control" name="kesto" id="kesto">

						<option value="1">1 hour</option>
						<option value="2">2 hours</option>
						<option value="3">3 hours</option>
						<option value="4">4 hours</option>
						
					</select>
				</div>
				
				
					</div>
					
					
				</div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control"  name ="message" id="message"></textarea>
          </div>
                
                
                <input type="hidden" id="day" name="day" value="">
          
                <input type="hidden" id="service_id" name="service_id" value="">
                 <input type="hidden" id="business_id" name="business_id" value="">
                
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="add" >Add</button>
      </div>
    </div>
  </div>
</div>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
    $('#add').click(function() {
          	   	 
      	 if($("#newOrder").valid()){
   		      	
      		$('#modal').modal('hide');
     
       		console.log("coords.done");
      		   $.ajax({
                     type: "POST",
                     url: "Servlet_tilaukset",
                     data: $('#newOrder').serialize(),
                     success: function (data) {
                   	 console.log(data);
           	  
                     }
                 }); 
      	
       	
       	}
      	
       
       });
       
     
       
       
       
         $("#newOrder").validate({ 
       	  errorClass: 'errors',
             rules: {
             	
           	  name: { 
           		  required : true 
           		  },
             	
             
                 phone: {
                     required: true,
                     number: true,
                 },
                 
                 company: {
                     required: true,
                     
                 },
                 
                 service: {
                     required: true,
                     
                 }
               
               
                
             },	
             messages: {
             	name: {     
     				required: "This field is required.",						
     			},
     			
     			phone: {
     				required: "This field is required.",
     				number: "Must be a number"				
     			},
     			company: {
     				required: "This field is required.",
     								
     			},
     			service: {
     				required: "This field is required.",
     								
     			}
     		}
     		
      
         });
         
    	for ( var i=0; i<24; i++){
    		 if (i<10){
    			 i="0"+i;
    		 }
    		$("#starthour").append("<option value="+i+">"+i+"</option>");
    		$("#endhour").append("<option value="+i+">"+i+"</option>");
    	}

    
    	selectCompany();
        function selectCompany(){
      		$("#company").append("<option id='-1'></option>");
      		$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
      			
      			if(result!=""){
      				$.each(result, function(i, field){
          	        	$("#company").append("<option value='"+field.business_id+"'>"+field.alias+"</option>");
          	   
          	        });
      				
      			}else{
      				
      				selectCompany();
      			}
      	        
      	    });
      	}
        
      
        $("#service").change(function(){
        	
        	var value=$(this).val();
        
        	$("#service_id").val(value);
        	  $("#service option[id='-1']").remove(); 
        });

        $("#company").change(function(){	
        	$("#service").empty();
        	var value=$(this).val();
        	$("#business_id").val(value);
        	
        	$("#service").append("<option id='-1'></option>");
      		$.getJSON("Servlet_services?id="+value, function(result){
    
      					$.each(result, function(i, field){
          	        	$("#service").append("<option value='"+field.service_id+"'>"+field.title+"</option>");
          	   
          	        });
     				
      	
            });
      		
      	  $("#company option[id='-1']").remove(); 
      
        });
        
    </script>

  </body>
</html>

