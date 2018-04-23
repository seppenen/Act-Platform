<%@include file="header.jsp" %>



        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2 pl-3 pt-3 ">Add service</h1>
           
          </div>
<div class=" mb-3 bg-white shadow">
          <form action="Servlet_newService" method="post" id="newProduct" class="   p-3  mx-auto">
  <div class=" form-group">
    <label for="title">Title</label>
    <input  class="form-control" name="title" id="title" placeholder="Name">
  </div>
    <div class=" form-group ">
    <label for="price">Price</label>
    <input  class="form-control col-md-auto"  name="price" id="price" placeholder="00.00">
  </div>
    <div class=" form-group">
    <label for="availiblity">Available</label>
  
   <div class="form-row ">
    <div class="col-md-2  ">   
      <input class="form-control" name="from" id="from" placeholder="00.00">
    </div> 
    <label for=""> - </label>
    <div class="col-md-2">
      <input class="form-control"  name="to" id="to" placeholder="00.00">
    </div>
     <div class="col-md-auto">
      <input  class="form-control" name="days" id="days" placeholder="Mon, Tue, Wed, Thu, Fri, Sat, Sun">
    </div>
  </div>  </div>
  <div class="form-group">
    <label for="">Company</label>
    <select name="company" id="company" class="form-control" >
      
    </select>
  </div>
  <div class="form-group">
    <label for="">Availability / hour</label>
    <select  class="form-control" name="hours" id="hours">
      <option value="-1"></option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
  </div>
  <div class="form-group">
    <label >Description</label>
    <textarea class="form-control" name="description" id="description" rows="4"></textarea>
  </div>


  
 <input type="hidden" id="business_id" name="business_id" value="">
 <input type="hidden" id="image" name="image" value="">

  
</form>

     
     <label class="mb-3 pl-3" for="exampleFormControlTextarea1">Picture size 841x120</label>
 
   
  <form action="Servlet_upload" enctype="multipart/form-data" method="post" id="kuva"  class="was-validated">
 



  <div class="input-group p-3">

  <div class="custom-file">
        <input type="file" class="custom-file-input" name="uploadFile" id="upLoadFile" required />
        <label class="custom-file-label" for="uploadFile">Choose file</label>
        </div> 
        <div class="input-group-append">
        <input class="btn btn-primary" type="button" value="Upload" onclick="lataa()" /> 
        
 </div></div> 
      <label class="mb-3 pl-3" id="picture"></label>
 
 </form>
  
    <div class="form-group">
  <button class="m-3 btn btn-primary btn-md " id="done" type="button" disabled >Submit</button>
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


    <script>
    
   $('.custom-file-input').on('change', function() { 
    	   let fileName = $(this).val().split('\\').pop(); 
    	   $(this).next('.custom-file-label').addClass("selected").html(fileName); 
    	});
   
	$("#spinner").hide();

    $('#to').timepicker({ 'timeFormat': 'H:i' });
    $('#from').timepicker({ 'timeFormat': 'H:i' });
 
      
      $(".report").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });
      selectCompany();
      function selectCompany(){
    		$("#company").append("<option id='-1'></option>");
    		$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
    	        $.each(result, function(i, field){
    	        	$("#company").append("<option value='"+field.business_id+"'>"+field.business_name+"</option>");
    	   
    	        });
    	    });
    	}
      
      $("#company").change(function(){	
    	  $("#hours option[value='-1']").remove();
    	  $("#company option[id='-1']").remove(); 
  		var value=$(this).val();
  	$("#business_id").val(value);		
      });
      
      $('#done').click(function() {
    	 if(  $("#newProduct").valid()){
    		 
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
                    $('#image').val(data);
                    console.log(data);
                    
                  },
                  error : function(jqXHR, textStatus, errorThrown) {
                      alert('ERRORS: ' + textStatus);
                  }
              });
              
              
          }
  		}
  		$("#spinner").hide();
  		
  	}
      
      
    </script>

  </body>
</html>

