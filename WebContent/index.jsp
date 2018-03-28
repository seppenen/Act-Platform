<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
		String user =null;
		user= (String) request.getAttribute("errMsg");
		if (user==null) user="";	%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script><!-- datepickeriä varten -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style> 

label {
display: block;
float: left;
width: 8em;
}</style>

<body>
<div class="container-fluid pt-3 pb-3 pl-5 mb-5 h-500"><h2>Login</h2>
</div>
<div class="container-fluid mt-5 " >
<div class="row"> 
<div class="col-md-4 ">
</div>
<div class="col-md-4 ">
<form action="Servlet_Login" method="post" id="login-form" >

<p><label>Username:</label> <input type="text" id="username" name="username"></p>

<p><label>Password: </label><input type="password" id="password" name="password"></p>
<input type="submit" id ="login" value="Login"></form>
<div id="messageDiv"><%=user%></div>
</div>

</div>






<script>

$(document).ready(function(){
	
	
	
	
$("#login").on('click', function(){
    var username = $("#username").val();
    var password = $("#password").val();
    if(username == ""){
        $('#messageDiv').css("display","none");
        alert("Username is required");
        return;
    }
    if(password == ""){
        $('#messageDiv').css("display","none");
        alert("Password is required");
        return;
    }
    $.ajax({
        url : "Servlet_Login",
        method : post,
        data : {
            username : username,
            password : password
        },
        success : function(results){
            if(results != null && results != ""){
                showMessage(results);
                $('#messageDiv').css("display","block");
            }else{
                $('#messageDiv').css("display","none");
                $('#messageDiv').html("");
                alert("Some exception occurred! Please try again.");
            }
        }
    });
});
 

function showMessage(results){
    if(results == 'SUCCESS'){
        $('#messageDiv').html("<font color='green'>You are successfully logged in. </font>")
    }else if(results == 'FAILURE'){
        $('#messageDiv').html("<font color='red'>Username or password incorrect </font>")
    }
}

document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>
</body>
</html>