<%@include file="header.jsp" %>

	<div class="container-fluid">
	<div class="row  mt-5"  >
	<div class="col-5"></div>	
	
	<div class="col-md-auto ">New company</div>
	</div></div>
	
<div class="container-fluid  " id="comments">
	<div class=" row " >
		<div id ="sidemenu" class="col-md-auto menu">
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