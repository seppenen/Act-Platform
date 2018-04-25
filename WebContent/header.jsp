<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

    if(session.getAttribute("savePath")==null){
    	String savePath ="/Users/alexandrseppenen/eclipse-workspace/Targo/WebContent/images/";
    	session.setAttribute("savePath", savePath);		
    }
    
if(session.getAttribute("session")==null){

response.sendRedirect("index.jsp");
}
%>
    <%@ page import="model.User"%>  
<%@ page import="java.util.ArrayList"%> 
    <%@ page import="model.Order"%>
    <%! @SuppressWarnings("unchecked") %>
    
    <% String id= request.getParameter("id");
    

%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title> Project</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
   <link href='cal/fullcalendar.min.css' rel='stylesheet' />
      <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet' />

<link href='cal/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='cal/lib/moment.min.js'></script>
<script src='cal/lib/jquery.min.js'></script>
<script src='cal/fullcalendar.min.js'></script> 

   <style>
   
   
   body {
  font-size: 15px;
}

.shadow{
-webkit-background-clip: padding-box;

box-shadow: 0 0.5px 2px 0 rgba(0, 0, 0, .2);
}



.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

table {
border: 1px solid #dddd; 
}


.hat{

height: 50px;
color: #fff;
padding-top: 10px;
background-color: rgb(74, 118, 168);
-webkit-box-shadow: 0px 3px 11px 0px rgba(50, 50, 50, 0.26);
-moz-box-shadow:    0px 3px 11px 0px rgba(50, 50, 50, 0.26);
box-shadow:         0px 3px 11px 0px rgba(50, 50, 50, 0.26);


}

#calendar .fc-day:hover
{

background: #ccc;
transition: all .5s;
} 

#spinner{
margin-top: 0;
margin-left: 10px;
 width: 20px;
  height: 20px;
}

.sidebar-sticky {
 position: fixed;

 margin-left: 0px;

  padding-top: 30px;

}

.cal .nav-link {
  font-weight: 400;
  color: #333;
}

.cal .nav-link:hover {
  font-weight: 400;
  
  border-radius: 5px;
  
transition: all .2s;
  background-color: #e8f1f7;
}

.sidebar .nav-link {
  font-weight: 400;
  color: rgb(40, 84, 116)
}

.sidebar .nav-link:hover{
  font-weight: 400;
 

}


.sidebar .nav-link .feather {
  margin-right: 4px;
  color: rgb(153, 177, 197)
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: rgb(40, 84, 116)
  
}

 .errors {
      color: red;
     
   }


.sub-class{
margin-left: 30px;
font-size: 14px;


}


.service-item-hover{
background-color: black;
}



.border-top { border-top: 1px solid #e5e5e5; }
.border-bottom { border-bottom: 1px solid #e5e5e5; }

   
   </style>
   
  </head>
  
  
 <body class="bg-light">
  <div class="container-fluid hat sticky-top"> <h3>Company</h3></div>
    <div class="container bg-light">
      <div class="row ">
        <nav class="bg-light col-md-1 sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item ">
                <a class="nav-link " href="dash.jsp">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="calendar.jsp">
                  <span data-feather="calendar"></span>
                  Calendar
                </a>
              </li>
              <li class="nav-item" id="services">
                <a class="nav-link" href="services.jsp">
                  <span data-feather="box"></span>
                  Services
                </a>

  		 <div id="servicedrop" class="sub-class " style="display: none;">
  		<ul class="nav flex-column">
  		<li> <a class="nav-link" href="newService.jsp">New service</a></li>
  		<li> <a class="nav-link" href="services.jsp">Modify service</a></li>  
  		</ul></div>
  		 
              </li>
              <li class="nav-item" id="customers">
                <a class="nav-link" href="users.jsp">
                  <span data-feather="users"></span>
                  Customers
                </a>
                
             
              </li>
               <li class="nav-item" id="companylink">
                <a class="nav-link" href="companies.jsp">
                  <span data-feather="shopping-cart"></span>
                  Companies
                </a>
                <div id="companydrop" class="sub-class " style="display: none;">
  		<ul class="nav flex-column" id ="listcompany">
  		<li> <a class="nav-link" href="newCompany.jsp">New company</a></li>
  		
  		</ul></div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="settings.jsp">
                  <span data-feather="settings"></span>
                  Settings
                </a>
              </li>
             
            </ul>

          
          </div>
        </nav>
        
  <script>

  $(document).ready(function () {
	  
	 var a=0;
	  
  	
  	  $("#services").mouseover(function(){
  		 if(a==0){ 
  			 
  		 $("#servicedrop").slideDown("fast");
  		a=1;
  		 }
  	  
  	  });

  	  $("#services").mouseleave(function(){
  		if(a==1){ 
  			
  	   

  		 $("#servicedrop").slideUp("fast"); 
  		  a=0;

  		}
  	  });
  	  
  	  
  
 	 
  	  
 	
 	  $("#companylink").mouseover(function(){
 		 if(a==0){ 
 			 $("#companydrop").slideDown("fast");
 			 a=1;
 		 }
 	   
 	  });

 	  $("#companylink").mouseleave(function(){
 		 if(a==1){ 
 			 
 			
 			 $("#companydrop").slideUp("fast");
 			  a=0;
		  	
 		 }
 	    
 	  });

  	 
  	});
  
	$.getJSON("Servlet_Companies", function(result){
        $.each(result, function(i, field){
       
        	$("#listcompany").append("<li> <a class='nav-link' href='Servlet_editCompany?id="+field.business_id+"'>"+field.alias+"</a></li>");            
        });
    });
  </script>