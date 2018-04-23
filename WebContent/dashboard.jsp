<%@include file="header.jsp" %>

	<div class="container-fluid">
	<div class="row  mt-4"  >
	<div class="col-4"></div>	
	<div class="col-md-auto " id="orderbtn"><a id='orderlink'  href='#'>Orders</a></div>
	<div class="col-md-auto ">Manage service</div>
	<div class="col-md-auto "><a href="#" id="addLink" >Add service</a></div>
	</div></div>
	
<div class="container-fluid " id="comments">
	<div class="border row">
		<div id ="sidemenu" class="col-md-auto menu">
			<ul><a href="#" alt="Profile">U</a></ul>	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div>

	<div class="col-md-3 border"></div>
	<div class="col-md-2 mt-4 border service-form " id="add" >
 		 
 	 <label>Select Company: </label>
	<div class="mt-4 "  > 
	<label>Title: </label><br><br>
	<label>Price: </label><br><br>
	<label>Tags: </label><br><br>
	<label>Description: </label><br>
	
	</div>
 	
</div>

<div class="col-md-auto mt-4 border "> <select name="company" id="company" ></select>

<div class=" mt-4 service-form border"  id="add-block" > 
	<form action="Servlet_newService" method="post" id="newProduct">
 	<input type="hidden" id="business_id" name="business_id" value="">
	<input id="title" name="title"  type="text" class=" " placeholder="Service Name"><br><br>
	<input id="updatePrice" name="updatePrice"  type="text" class=" " placeholder="Price"><br><br>
	<input id="tags" name="tags"  type="text" class="" placeholder="Tag"><br><br>
	<textarea id="updateDescription" name="updateDescription"  rows="8" cols="51" class=" mb-1" placeholder="Write some description here"></textarea><br>
	<div id="uploaded-picture">Here will appears a upload result</div>
 	<input type="submit" class="mt-2 btn btn-primary btn-sm " id="done" value="Submit"> 
 	<input type="button" class=" mt-2 btn btn-default btn-sm" id="upload" value="Upload Picture" disabled>

	</form>
	</div>
	</div>
	




<div id="settings" class="service-form mt-4" >
<div id="addcompanydiv"><a href="#" id="addcompanylink" class="mb-3 col-4 float-right">Add company </a></div>

<div id="addcompany" > 	
 	<form action="Servlet_NewCompany" method="post" id="newCompanyForm">

 	<div class="d-inline mb-2 col-4 pr-2"><input id="newCompany" name="newCompany"  type="text" class="" placeholder="Business name"> 
 
 	 </div>
 	

 	<div class="d-inline mb-2"><input id="address" name="address"  type="text" class=" col-5" placeholder="Address"> 

 	<input type="button" class="mt-2 mb-3   btn btn-primary btn-sm " id="submit" value="Submit" > 
 	 	
 	 	</div>
 	   <input type="hidden"  id="lat" name="lat" value="">
 	 <input type="hidden" id="lng" name="lng" value="">
 	<input type="hidden" id="user" name="user" value="${session.getId()}"></form> 		

<div class="  col-11 business" id="errorMsg"> </div>

<div class="  col-11 business" id="business"> </div>


</div>

<br><br>
 

<div class=" col-11"> <label>Email:  </label>
<input id="email" name="email"  type="text" class="float-right mb-2 col-7" value="${session.getEmail()}"> </div>
<form action="Servlet_newProduct" method="post" id="newProduct"> <br>
<div class=" col-11 mb-2 "> <label>Password: </label>
<input id="password" name="password"  type="text" class="float-right col-7" placeholder="New password"> </div><br>
<div class="col-11 mb-2 "><label>Re-type password: </label>
<input id="password2" name="password2"  type="text" class=" float-right  col-7" placeholder="Repeat password"> <br></div>
 <div class=" col-11"> 	<input type="button" class="mt-2 float-right btn btn-primary btn-sm " id="done" value="Save"></div>
</form>
</div><br>

</div></div>
</div>

<div class="footer container-fluid pt-3 pb-3 pl-5 pr-0 h-200"><p>Footer</p>
</div>

</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<script type="text/javascript">


$(document).ready(function() {
	
	$("#addcompany").hide();
	
	$("#addcompanylink").on("click", function() {
		$("#addcompanydiv").hide();
		$("#addcompany").fadeIn();
		
    });
	
	/* $("#address").blur(function(){
	    
	geocode();
	}); */
	
	
 function activatebutton(){
	 $("#submit").prop('disabled', false);
	 
 }
	
	
	$("#submit").click(function(event){	
		
		if ($('#address').val()==""){
			
		}else{
		submit();
		}
	});
	
	
	  $('#address').keyup(function() {
          geocode();
       });
	
function geocode(){
	
var location=$('#address').val();

axios.get('https://maps.googleapis.com/maps/api/geocode/json',{

params:{
address:location,
key:'AIzaSyDYGmROPS0aVzBLHXoT1zWHEpIipah9w2A'
}

})

.then(function(response){
console.log(response);

var lat = response.data.results[0].geometry.location.lat;
var lng = response.data.results[0].geometry.location.lng;
$("#lat").val(lat);
$("#lng").val(lng);




})

.catch(function(error){
	$("#errorMsg").html("<h3>error</h3>");
console.log(error);
})
}

	
	$("#company").change(function(){			
		var value=$(this).val();
	$("#business_id").val(value);		
    });

    $("#newProduct").validate({ 
        rules: {
        	
        	company:{      		
        		required: true
        	},
        	
        	title: {
                required: true,
                minlength: 2
            },
            updatePrice: {
                required: true,
                number: true,
            },
            tags: {
                required: true
            },
            updateDescription: {
                required: true,
                minlength: 2
            }
        },	
        messages: {
        	company: {     
				required: "Puuttuu",						
			},
			title: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			updatePrice: {
				required: "Puuttuu",
				number: "Ei kelpaa"				
			},
			updateDescription: {
				required: "Puuttuu",
				number: "Ei kelpaa"				
			},	
			tags: {
				required: "Puuttuu",
						
			}
		},	 
        submitHandler: function (form) {
            $.ajax({
                type: "POST",
                url: "Servlet_newService",
                data: $(form).serialize(),
                success: function () {
                   alert("OK");
                        
                }
            });
            return false; // required to block normal submit since you used ajax
        }
    });
	
	if (${session.getStatus()}==1){
		$("#sidemenu").prepend("<ul ><a href='#' alt='Users' id='userstn'>G</a></ul >");
		
	}
	selectCompany();	
	listCompany();	
	$("#settings").hide();
	$("#add-block").show();
	$("#settingsbtn").bind("click", showSettings);
	$("#addLink").bind("click", showManage);

	
});


function listCompany(){	
	
	$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
        $.each(result, function(i, field){
        br="<br>";
        	$("#business").append("<div id='place' value='"+field.business_id+ "'><div class='d-inline pr-2'>"+field.business_name+ "</div><div class='d-inline pl-2 col-3 float-right'><a href='#' id='delete'>Delete</a></div>"+br);            
        });
    });
	}
	
function selectCompany(){
	$("#company").append("<option>Valitse merkki</option>");
	$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
        $.each(result, function(i, field){
        	$("#company").append("<option value='"+field.business_id+"'>"+field.business_name+"</option>");
   
        });
    });
}

	
function submit(){

   
    $.ajax({
 url: 'Servlet_NewCompany',
 type: 'POST',
 data: {
     user: $("#user").val(),
     newCompany: $("#newCompany").val(),
     address: $("#address").val(),
     lat:$("#lat").val(),
     lng:$("#lng").val()
     
 }, 
        dataType: 'html'
    })
    .done(function(data){
    	$('#business').empty();
    	listCompany();
    	$("#newCompany").val("");
    	
    })
    .fail(function(){
 alert('Ajax Submit Failed ...'); 
    });
    
};



function showSettings(){
	$("#add").hide();
	$("#add-block").hide();
	$("#business").empty();
	listCompany();
$("#settings").show();
}

function showManage(){
	$("#company").empty();
	selectCompany();
	$("#settings").hide();
	
$("#add").show();
$("#add-block").show();


}




</script>

<script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>