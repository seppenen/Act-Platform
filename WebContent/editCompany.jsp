<%@include file="header.jsp" %>
<%@ page import="model.Company"%>

<%
Company company = null;
if( request.getAttribute("company")!=null){
	company = (Company)request.getAttribute("company");	
}
%>


<div class="col-sm-1 "></div>
	<div class="col-md-2 mt-4  service-form " id="add" >
 		 
 	
	<div class="mt-4 "  > 
	<label>Name: </label><br><br>
	<label>Address: </label><br><br>
	<label>Open time: </label><br><br>
	<label>Tags: </label><br><br>
	<label>Description: </label><br>
	
	</div>
 	
</div>

<div class="col-md-auto mt-4  "> 

<div class=" mt-4 service-form "  id="add-block" > 
	<form action="Servlet_editCompany" method="post" id="newProduct">
 	<input type="hidden" id="business_id" name="business_id" value="<%out.print(company.getId());%>">
	<input id="title" name="title"  type="text" class=" " value="<%out.print(company.getName());%>"><br><br>
	<input id="address" name="address"  type="text" class="" value="<%out.print(company.getAddress());%>"><br><br>
		<input id="opentime" name="opentime"  type="text" class="" value="<%out.print(company.getOpentime());%>">&nbsp;-
	<input id="closetime" name="closetime"  type="text" class="" value="<%out.print(company.getClosetime());%>"><br><br>
	<textarea id="description" name="description"  rows="8" cols="51" class=" mb-1"><%out.print(company.getDescription());%></textarea><br>
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