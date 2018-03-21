<%@include file="header.jsp" %>

<div class="container-fluid">
	<div class="row  mt-5"  >
	<div class="col-5"></div>	
	
	<div class="col-md-auto "></div>
	</div></div>
	
<div class="container-fluid  " id="comments">
	<div class=" row " >
		<div id ="sidemenu" class="col-md-auto menu">
			<ul><a href="#" alt="Profile">U</a></ul>	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div>

<div class="col-md-2 "></div>
	<div class="col-md-2 mt-4  service-form " id="add" >
 		 
 	
	<div class="mt-4 "  > 
	<label>Name: </label><br><br>
	<label>Address: </label><br><br>
	<label>Tags: </label><br><br>
	<label>Description: </label><br>
	
	</div>
 	
</div>

<div class="col-md-auto mt-4  "> 

<div class=" mt-4 service-form "  id="add-block" > 
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

<div class="footer container-fluid pt-3 pb-3 pl-5 pr-0 h-200" ><p>Footer</p>
</div>

</body>

<script type="text/javascript">

$(document).ready(function() {
	
	listCompany();	
	if (${session.getStatus()}==1){
		$("#sidemenu").prepend("<ul ><a href='#' alt='Users' id='userstn'>G</a></ul >");		
	}
});

function listCompany(){	
	
	$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
        $.each(result, function(i, field){
        br="<br>";
        	$("#container-companies").append("<div class='col-md-auto d-inline-block mt-4 border service-form'><div class='col company-name' ><b>"+field.business_name+ "</b></div> <a href='#' class='companyimg' value='"+field.business_id+"'> <img src='images/noimage.png'></a> </div> ");            
        });
    });
	}
	
document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>