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
padding-left: 0px;


}
.menu ul:hover {

	
}

.business
{
padding-left: 50px;
	font-size:12px;	
}


.button-service
{
margin-top:20px;	
}

.companyimg
{
width:150px;
height:150px;
}


.container-companies
{
width:70%;

}

.company-name, .error
{
text-align: center;

}

.service-form
{


font-size:12px;	
}
</style>
<div class="logo container-fluid pt-3 pb-3 pl-5 pr-0 h-500"><h2>Actify</h2>
</div>

	<div class="container-fluid">
	<div class="row  mt-5"  >
	<div class="col-5"></div>	
	
	<div class="col-md-auto ">New company</div>
	
	</div>
	</div>
	
<div class="container-fluid  " id="comments">
	<div class=" row " >
		<div id ="sidemenu" class="col-md-2 menu">
			<ul><a href="#" alt="Profile">U</a></ul>	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
</div>