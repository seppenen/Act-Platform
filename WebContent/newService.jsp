<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

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
    

    <title>Dashboard</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
   <script type="text/javascript" src="jquery.timepicker.js"></script>
  <link rel="stylesheet" type="text/css" href="jquery.timepicker.css">  
    <link href="dashboard.css" rel="stylesheet">
  </head>

  <body>
  <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

      <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
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
              <li class="nav-item">
                <a class="nav-link" href="services.jsp">
                  <span data-feather="box"></span>
                  Services
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="users.jsp">
                  <span data-feather="users"></span>
                  Customers
                </a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="companies.jsp">
                  <span data-feather="shopping-cart"></span>
                  Companies
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="settings.jsp">
                  <span data-feather="settings"></span>
                  Settings
                </a>
              </li>
             
            </ul>
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Options</span>
             
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" value="1" href="services.jsp">
                  <span data-feather="file-text"></span>
                 Modify service
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link report" id="7" value="7" href="newService.jsp">
                  <span data-feather="file-text"></span>
                  Add service
                </a>
              </li>
         
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Add service</h1>
           
          </div>

          <form action="Servlet_newService" method="post" id="newProduct" class="col-md-8 mx-auto">
  <div class=" form-group">
    <label for="title">Title</label>
    <input  class="form-control" name="title" id="title" placeholder="Name">
  </div>
    <div class=" form-group ">
    <label for="price">Price</label>
    <input  class="form-control col-md-auto"  name="price" id="price" placeholder="00.00">
  </div>
    <div class=" form-group">
    <label for="availiblity">Available</label>
  
   <div class="form-row ">
    <div class="col-md-2  ">   
      <input class="form-control" name="from" id="from" placeholder="00.00">
    </div> 
    <label for="exampleFormControlInput1"> - </label>
    <div class="col-md-2">
      <input class="form-control"  name="to" id="to" placeholder="00.00">
    </div>
     <div class="col-md-auto">
      <input  class="form-control" name="days" id="days" placeholder="Mon, Tue, Wed, Thu, Fri, Sat, Sun">
    </div>
  </div>  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Company</label>
    <select name="company" id="company" class="form-control" >
      
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect2">Availability / hour</label>
    <select  class="form-control" name="hours" id="hours">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" name="description" id="description" rows="4"></textarea>
  </div>
  <label for="exampleFormControlTextarea1">Upload picture</label>
  <div class="mb-3 input-group">
  
  <div class="custom-file">
    <input type="file" class="custom-file-input" id="imageinput">
    <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
  </div>
  <div class="input-group-append">
    
    <button class="btn btn-primary" type="button">Upload</button>
    
  </div>
  
</div>
 <label class="mb-3" for="exampleFormControlTextarea1">Picture size 841x120</label>
 <input type="hidden" id="business_id" name="business_id" value="">
  <div class="form-group">
  <input type="submit" class="mt-2 btn btn-primary btn-md " id="done" value="Submit"> 
 </div>
</form>

       
  </div>
        </main>
      </div>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
    
    $('#to').timepicker({ 'timeFormat': 'H:i' });
    $('#from').timepicker({ 'timeFormat': 'H:i' });
 
      
      $(".report").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });
      selectCompany();
      function selectCompany(){
    		$("#company").append("<option>Select</option>");
    		$.getJSON("Servlet_Companies?user="+'${session.getUsername()}', function(result){
    	        $.each(result, function(i, field){
    	        	$("#company").append("<option value='"+field.business_id+"'>"+field.business_name+"</option>");
    	   
    	        });
    	    });
    	}
      
      $("#company").change(function(){			
  		var value=$(this).val();
  	$("#business_id").val(value);		
      });
      
      
      $("#newProduct").validate({ 
          rules: {
          	
          	company:{      		
          		required: true
          	},
          	
          	title: {
                  required: true,
                  minlength: 2
              },
              price: {
                  required: true,
                  number: true,
              },
              from: {
                  required: true
              },
              to: {
                  required: true
              },
              days: {
                  required: true
              },
              description: {
                  required: true,
                  minlength: 2
              }
          },	
          messages: {
          	company: {     
  				required: "This field is required.",						
  			},
  			title: {
  				required: "This field is required.",
  				minlength: "Must be a number"
  			},
  			price: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			},
  			updateDescription: {
  				required: "This field is required.",
  				number: "Must be a number"				
  			},	
  			tags: {
  				required: "This field is required.",
  						
  			}
  		},	 
          submitHandler: function (form) {
              $.ajax({
                  type: "POST",
                  url: "Servlet_newService",
                  data: $(form).serialize(),
                  success: function () {
                	  $('#newProduct').trigger("reset");
                          
                  }
              });
              return false; // required to block normal submit since you used ajax
          }
  		
      });
      
    </script>

  </body>
</html>

