<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  
  <style>
  
  html,
body {
  height: 100%;
}

body {

  display: flex;

  align-items: center;

  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  
  width: 330px;
  padding: 15px;
  margin: 0 auto;
}



  
  </style>

<%
		String error =null;
		error= (String) request.getAttribute("errMsg");
		if (error==null) error="";	%>



    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

   

    <title>Login</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

    
  </head>

  <body class="text-center">
    <form action="Servlet_Login" method="post"  id="kirjautuminen" class="form-signin">
     
      <h1 class="mb-3 ">Login</h1>
      
      <input type="email" name="inputEmail" autocomplete="on" class="form-control" placeholder="Email address" required autofocus>
      
      <input type="password" name="inputPassword" class="form-control" placeholder="Password" required>
      <div class="mb-3" id="errorMsg">
        <%out.print(error);%>
      </div>
      <input class="btn btn-md btn-primary btn-block" id="login" value="Sign in" type="submit">
     
    </form>


<script type="text/javascript">

$(document).ready(function(){

	$("#login").click(function(event){	
		if($("#inputEmail").val().length>0&&$("#inputPassword").val().length>0){
		document.forms["kirjautuminen"].submit();
		}
	});
	
});
	

 
</script>
</body>
</html>