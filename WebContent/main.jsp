<%@include file="header.jsp" %>

	<div class="container-fluid">
	<div class="row  mt-5"  >
	<div class="col-5 "></div>	
	
	<div class="col-md-auto ">New company</div>
	</div></div>
	
<div class="container-fluid  " id="comments">
	<div class=" row " >
		<div id ="sidemenu" class="   col-md-auto menu">
			<ul><a href="#" alt="Profile">U</a></ul>	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div>

	<div class="col-md-2 "> </div>
	<div class="container-companies" id="container-companies">

 	</div>
</div>
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
        	$("#container-companies").append("<div class='col-md-auto d-inline-block mt-4 border service-form'><div class='col company-name' ><b>"+field.business_name+ "</b></div> <a href='#' class='companyimg' value='"+field.business_id+"'> <img src='images/noimage.png'></a> </div> ");            
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