<%@include file="header.jsp" %>
<%@ page import="model.Order"%>

	
<div class="container-fluid " id="comments">
	<div class=" row mt-5 " >
		<div id ="sidemenu" class="col-md-auto menu   ">
			<ul><a href="main.jsp" alt="Profile">U</a></ul>
			<ul ><a href='#' alt='Users' id='userstn'>G</a></ul >	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
		
</div>

<div class="container " >
<div class="container nav-menu  ">
	<div class="row  mb-1"  >
	<div class="col-4 "></div>	
	<div class="col-md-auto ">Orders</div>	
	<div class="col-md-auto ">Manage resources</div>
	<div class="col-md-auto ">Manage company</div>
	
	</div>
	</div>
<table class="table table-sm table-hover mt-4 orders">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
<%

if( request.getAttribute("tilaukset")!=null){
	ArrayList <Order> order = (ArrayList<Order>)request.getAttribute("tilaukset");	

	for(int i=0;i<order.size();i++){
		out.print("\n<tr>");
		out.print("<th scope='row'>" + order.get(i).getId()+"</th>");
		out.print("<td>" + order.get(i).getTitle()+"</td>");
		out.print("<td>" + order.get(i).getDate()+"</td>");
		out.print("<td>" + order.get(i).getStatus()+"</td>");
		out.print("<td> View Complete </td>");
		out.print("</tr>");
		
	/*	out.print("</div>");
		out.print("\n<img src='images/modify.png' class='icon muokkaa' id='muokkaa_"+asiakkaat.get(i).getAsiakas_id()+"' name='"+asiakkaat.get(i).getEtunimi()+" "+asiakkaat.get(i).getSukunimi()+"' title='Muokkaa'>");
		out.print("\n<img src='images/delete.png' class='icon poista' id='poista_"+asiakkaat.get(i).getAsiakas_id()+"' name='"+asiakkaat.get(i).getEtunimi()+" "+asiakkaat.get(i).getSukunimi()+"' title='Poista'>");
		out.print("</td>");
		out.print("</tr>")
		*/
	}	
}
%>

</tbody>
	</table>
	</div>

</div>



</div>

<div class="footer container-fluid pt-3 pb-3 pl-5 pr-0 h-200" ><p>Footer</p>
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
        	$("#container-companies").append("<div class='col-md-auto d-inline-block mt-4 border service-form'><div class='col company-name' ><b>"+field.business_name+ "</b></div> <a href='#' class='companyimg' value='"+field.business_id+"'> <img src='images/noimage.png'></a> </div> ");            
        });
    });
	}
	
document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>