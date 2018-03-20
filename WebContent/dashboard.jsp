<%

if(session.getAttribute("session")==null){

response.sendRedirect("index.jsp");
}
%>

<%@ page import="model.User"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 </head>
<body>

	
	

<style> 
.icon_mini{
	height:20px;
	vertical-align:bottom;
}
@font-face {
    font-family: 'SignifyLite';
    src: url('signifylite-webfont.eot');
    src: url('signifylite-webfont.eot?#iefix') format('embedded-opentype'),
         url('signifylite-webfont.woff') format('woff'),
         url('signifylite-webfont.ttf') format('truetype'),
         url('signifylite-webfont.svg#SignifyLite') format('svg');
    font-weight: 600;
    font-style: normal;

}

.logo {
		font-weight: 500;
	color: white;
    background-color:  #b61483  ;
  padding: 0 90px;
}

.footer {
	
position: absolute;
margin-top:300px;
	font-weight: 500;
	color: white;
    background-color:  #b61483  ;
  padding: 0 90px;
}

a {
color: black;
}
a:hover{
	color: black;
text-decoration: none;
}
.icon{
	height:30px;
}
.topmenu a{
font-family: 'SignifyLite';
font-size: 20px;
padding-left: 10px;
color: #2973fa;
}
.signify {
font-family: 'SignifyLite';
font-size: 20px;
padding-left: 10px;
color: #2973fa;

}
.menu ul{
height:50px;
font-family: 'SignifyLite';
font-size: 30px;
padding-left: 15px;
padding-right: 50px;
max-width:50px;
	
}
.menu ul:hover {
padding-right: 50px;


	background-color: #ddd
	
}
.business
{padding-left: 50px;
	font-size:12px;	
}
.button-service
{
margin-top:20px;	
}

.service-form
{
font-size:12px;	
}
</style>
<div class="logo container-fluid pt-3 pb-3 pl-5 pr-0 h-500"><h2>Actify</h2>
</div>
	
<div class="container-fluid mt-5 " id="comments">
	<div class="row">
		<div id ="sidemenu" class="menu">
			<ul><a href="#" alt="Profile">U</a></ul>	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div><div class="col-3"></div>
<div id="" >
	<div class="d-inline mr-5 " id="orderbtn"><a id='orderlink'  href='#'>Orders</a></div>
	<div class="d-inline mr-5  ">Manage service</div>
	<div class="  mr-5 d-inline "><a href="#" id="addLink" >Add service</a></div>
	
	<div class="mt-4" id="add" >
 		 
 	 	<div class="service-form"><label>Select Company: </label>
 	<span class="float-right" ><select name="company" id="company" ></select></span></div>
 	
</div>


	<div class="service-form" id="add-block" > 	
 	<div class="service-form"> 
 	<form action="Servlet_newService" method="post" id="newProduct">
 	<input type="hidden" id="business_id" name="business_id" value="">
 	<div id="test"></div>
 	<div><br><label>Title: </label>
 	<input id="title" name="title"  type="text" class=" float-right " placeholder="Service Name"> <br><br>
 	<label>Price: </label>
 	<input id="updatePrice" name="updatePrice"  type="text" class="float-right " placeholder="Price"><br><br>
 	<label>Tags: </label>
 	<input id="tags" name="tags"  type="text" class="float-right " placeholder="Tag"><br><br>
 	<label>Description: </label><br>
 	<textarea id="updateDescription" name="updateDescription"  rows="8" cols="51" class="float-right  mb-1" placeholder="Write some description here"></textarea><br>
 	<div id="uploaded-picture">Here will appears a upload result</div>
 	<input type="button" class="float-left mt-2 btn btn-default btn-sm" id="upload" value="Upload Picture">
<input type="submit" class="mt-2 btn btn-primary btn-sm float-right" id="done" value="Submit"> </div>
  </form></div>
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