<%@include file="header.jsp" %>


	
	
<div class="container-fluid mt-5  " id="comments">
	<div class=" row " >
		<div id ="sidemenu" class="col-md-2 menu">
			<ul><a href="main.jsp" alt="Profile">U</a></ul>
			<ul ><a href='#' alt='Users' id='userstn'>G</a></ul >	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div>
	<div class=" container-companies " id="container-companies">
	
 	</div>
</div>
</div>

<div class="footer container-fluid pt-3 pb-3 pl-5 pr-0 h-200"><p>Footer</p>
</div>

</body>

<script type="text/javascript">
$(document).ready(function() {
	
	listCompany();
	
});
function listCompany(){	
	
	$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
        $.each(result, function(i, field){
        br="<br>";
        	$("#container-companies").append("<div class='col-md-auto d-inline-block mt-1 border service-form'><div class='col company-name' ><b>"+field.business_name+ "</b></div> <a href='#' class='companyimg' id='companyItem' value='"+field.business_id+"'> <img src='images/noimage.png'></a> </div> ");            
        });
    });
	
	}
	
	
$(document).on("click", "#companyItem",function() {
	
	document.location="Servlet_tilaukset?id=" +$(this).attr('value');
});
	
	
document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>