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
   
   <style>
   
   
   body {
  font-size: .875rem;
}

.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

/*
 * Sidebar
 */
.hat{
position: sticky-top;
height: 55px;
color: #fff;
padding-top: 10px;


}

#calendar .fc-day:hover
{

background: #ccc;
transition: all .5s;
} 

.sidebar-sticky {
 
  position: fixed;
  top: 48px; /* Height of navbar */

  padding-top: 20px;
* Scrollable contents if viewport is shorter than content. */
}

.cal .nav-link {
  font-weight: 500;
  color: #333;
}

.cal .nav-link:hover {
  font-weight: 500;
  color: #ddd;
  border-radius: 5px;
  
transition: all .5s;
  background-color: #323741;
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}


.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #999;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}



.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: 1rem;
  background-color: rgba(0, 0, 0, .25);
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.sub-class{
margin-left: 23px;
font-size: 13px;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

/*
 * Utilities
 */

.border-top { border-top: 1px solid #e5e5e5; }
.border-bottom { border-bottom: 1px solid #e5e5e5; }

   
   </style>
   
  </head>

  <body>
 
 <div class="container-fluid hat bg-dark sticky-top"> <h3>Logo</h3></div>
    <div class="container-fluid ">
      <div class="row ">
        <nav class="col-md-2 sidebar">
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

  		 <div id="servicedrop" class="sub-class ">
  		<ul class="nav flex-column">
  		<li> <a class="nav-link" href="newService.jsp">Add service</a></li>
  		<li> <a class="nav-link" href="services.jsp">Modify service</a></li>  </ul></div>
  		 
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

          
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-3 px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
       <h1 class="h2">Dashboard</h1>    
       
        <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link report " value="1" href="#">Day</a>
  </li>
  <li class="nav-item">
    <a class="nav-link report" value="7" href="#">Week</a>
  </li>
  <li class="nav-item">
    <a class="nav-link report" value="30" href="#">Month</a>
  </li>
  <li class="nav-item">
    <a class="nav-link report" value="90" href="#">Quarter</a>
  </li>
</ul>

           
          </div>

          <canvas class="my-4" id="myChart" width="900" height="380"></canvas>

         
          <table class="table table-md table-hover mt-4 orders">
 		<div class="col-md-12 mt-2 table-top"><h2>Latest Activity</h2></div>
          <thead class="thead-dark">

    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody id="tilaukset">



	




</tbody>
		</table>
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
    
    $(document).ready(function () {
    	 $("#servicedrop").hide(); 
    	  $("#services").mouseenter(function(){
    	    $("#servicedrop").show(); 
    	  });

    	  $("#services").mouseleave(function(){
    	    $("#servicedrop").hide(); 
    	  });

    	 
    	});
    	
    var a=$.Deferred();
    var b=$.Deferred();
    var colorIteration=0;
    
    var timeFormat = 'YYYY-MM-DD';
    var timeFormat2 = 'DD MMM';
    var labels= []; 
    var chartlabels= [];// Dates
    var parsedData=[];
    var userServices=[];
    var newDataset;
    
    $( document ).ready(function() {
    	
  	  if(labels[0]==null){
  			console.log("newDate");
  		labelFunction(30);

  	}
  	    	     
  });
    
    function labelFunction(num){
  	  console.log("labelFunction");
  	 	 labels.length = 0;
  	 	chartlabels.length = 0;
  		 	for (i=0; i<num;i++){
  	      	labels.push(newDate(0-i, timeFormat));
  	      chartlabels.push(newDate(0-i, timeFormat2));
  	      	
  	      	}
  		 	b.resolve();
  		 //	labels.reverse();
  	      	myChart.update();
  	      	 
        	 
  		}
    
    
    var  config = {
	      	  type: 'bar',
	            beginAtZero: false,

	      	    
	      	  data: {
	      	    datasets: [],
	      	    labels: chartlabels,
	      	  },     
	          options: {
	          	scales: {
	  				xAxes: [{
	  		
	  				}],
	  				yAxes: [{
	  					ticks: {
	  	                    beginAtZero:false
	  	                }
	  				}]
	  			},
	  			legend: {
	  	            display: true,
	  	          },
	          }
	        };
    
    function parseData(data){
    	
	
    	if (parsedData.length>0)
    	{
    		parsedData=[]; 
    		
    	}
    	
    	
        var paikat = JSON.parse(data); 
		var label;
        

         for(var i=0;i<labels.length;i++){
				var q=0;
      	   for(var j=0;j<paikat.length;j++){
      		
                if (paikat[j].start.toString().substring(0, 10)==labels[i]){
                	console.log(paikat[j].start.toString().substring(0, 10));
              	 q++; 
              	 label=paikat[j].title;
              	 
                }
       
                 } 
      	 parsedData[i]=q;
             }
         dataPush(label);

  
         }
    

    function getData(){

    	console.log("getData");
    	
    	for (var i=0; i<userServices.length; i++){
    	
        $.ajax({
                  type: 'GET',
                  url: 'Servlet_tilastoJson?id='+userServices[i],
                		                   
                  success: function(data){
                	  
              		 parseData(data);
           				
                  },
                  error: function(){  
                      console.log(2);                                         
                  }
              });          
    	}
    
  }
    
   
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, config);
    

     function haeServices(){	
    	
  	 $.ajax({
  		  url: "Servlet_tilauksetJSON",
  		 success: function(result){
  			var jsonData = JSON.parse(result);
		// var data=(Array.from(result));
  		 		  
  				 for(var i=0;i<jsonData.length;i++){
  					userServices[i]=jsonData[i].service_id;
  		  }
		
		a.resolve();
	    }});
	
	
    }
    
     haeServices();
     $.when(a, b).done(getData);
    
	function newDate(days,f) {		
		return moment().add(days, 'd').format(f);	
	}
	   
      function dataPush(label){
    	  
  var color=['Red', 'Blue', 'Purple', 'Yellow','green', 'black','pink'];
    	
  		for (var i=0; i<parsedData.length; i++){
    		
    		  if(parsedData[i]>0){
    			  	
    	  console.log("dataPush()");
    	
    	   newDataset = {
  				label: label,
  				 backgroundColor: color[colorIteration],
  				fill: false,
  				data: parsedData,
  				 // backgroundColor: 'transparent',
  				
  	           // backgroundColor: 'transparent',
  	          
  	            borderWidth: 0,
  	            pointBackgroundColor: '#007bff'
  			};

  			config.data.datasets.push(newDataset);
  			myChart.update();
  			
  			 
  			 
  			parsedData=[];
  			colorIteration++;
    		  }
    	  }   
    	  
      }
     
    
      
      $(".report").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });

      

      $.getJSON("Servlet_tilaukset", function(result){
                         $.each(result, function(i, field) {
                          
                           $("#tilaukset").append("<tr><th scope='row'>"+field.id+"</th><td>"+field.title+"</td> <td>"+field.start.toString().substring(0, 10)+" "+field.start.toString().substring(11)+"</td><td>"+field.status+"</td> <td> View Complete </td></tr>");
                      });
                  });
      		

    </script>

  </body>
</html>

