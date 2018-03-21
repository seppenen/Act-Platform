<%@include file="header.jsp" %>



	
	<div class="container-companies " id="container-companies">

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
        	$("#container-companies").append("<div class='col-md-auto d-inline-block mt-1 border service-form'><div class='col company-name' ><b>"+field.business_name+ "</b></div> <a href='#' class='companyimg' id='companyItem' value='"+field.business_id+"'> <img src='images/noimage.png'></a> </div> ");            
        });
    });
	
	}
	
	
$(document).on("click", "#companyItem",function() {
	
	document.location="Servlet_editCompany?id=" +$(this).attr('value');
});
	
	
document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>