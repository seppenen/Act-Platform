<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-dark bg-dark p-0">
      <div class="navbar-brand col-sm-3 bg-dark col-md-2 mr-0" >Targo</div>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid ">
      <div class="row ">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column ">
              <li class="nav-item ">
                <a class="nav-link " href="#">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="calendar"></span>
                  Calendar
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="box"></span>
                  Services
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="users"></span>
                  Customers
                </a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="shopping-cart"></span>
                  Companies
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="settings"></span>
                  Settings
                </a>
              </li>
             
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Reports</span>
             
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" value="1" href="#">
                  <span data-feather="file-text"></span>
                  Current day
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="7" value="7" href="#">
                  <span data-feather="file-text"></span>
                  Last week
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" value="30" href="#">
                  <span data-feather="file-text"></span>
                  Last month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" value="90" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
           
          </div>

          <canvas class="my-4" id="myChart" width="900" height="380"></canvas>

          <button id="addbtn" value="Test">Test</button>
           <button id="addbtn2" value="Test">Test</button>
           <button id="addbtn3" value="Test">Test</button>
          <table class="table table-sm table-hover mt-4 orders">
 		<div class="col-md-12 mt-2 table-top"><h2>Section title</h2></div>
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
		out.print("<td>" + order.get(i).getStart()+"</td>");
		out.print("<td>" + order.get(i).getStatus()+"</td>");
		out.print("<td> View Complete </td>");
		out.print("</tr>");
			}	

}
 %>




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
    
    var timeFormat = 'YYYY-MM-DD';
    var labels= [newDate(-6), newDate(-5),newDate(-4),newDate(-3),newDate(-2),newDate(-1),newDate(-0)]; // Dates
    
    var data=[];

    var businessName;
   

	function newDate(days) {
		
		return moment().add(days, 'd').format(timeFormat);	
	}
	
      var config = {
    	  type: 'line',
    	    
    	  data: {
    	    datasets: [        
    	        ],
    	    labels: labels,
    	  },     
        options: {
        	scales: {
				xAxes: [{
		
				}],
				yAxes: [{
					scaleLabel: {
						
						labelString: 'value'
					}
				}]
			},
			legend: {
	            display: false,
	          },
        }
      };
 
 
      $(document).ready(function() {

    	  var newDataset = {
  				label: businessName,
  				backgroundColor: 'blue',
  				fill: false,
  				data: data.reverse(),
  				backgroundColor: 'transparent',
  	            borderColor: '#007bff',
  	            borderWidth: 4,
  	            pointBackgroundColor: '#007bff'
  			};

  			config.data.datasets.push(newDataset);
  			myChart.update();
  			
  			if(labels[0]==null){
    	  		labelFunction(7);
    	  		
    	  	}
      });
      
      function addData(data) {
    	  console.log(data);
    	
    	  
    	  myChart.data.datasets.forEach((dataset) => {
    	        dataset.data.push(data);
    	    });
    	  myChart.update();
    	}
      
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, config);
      
      $("#addbtn2").on("click", function() {
      	
    	  var newDataset = {
    				label: businessName,
    				backgroundColor: 'red',
    				fill: false,
    				data: data2.reverse(),
    				backgroundColor: 'transparent',
    	            borderColor: 'red',
    	            borderWidth: 4,
    	            pointBackgroundColor: 'red'
    			};

    			config.data.datasets.push(newDataset);
    			myChart.update();
      	
      });
      
      $(".nav-link").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });

      function labelFunction(num){
    	 	 labels.length = 0;
    		 	for (i=0; i<num;i++){
    	      	labels.push(newDate(0-i));	 
    	      	}
    		 	labels.reverse();
    	      	myChart.update();
    	      
    	      	 tilastot();
    		}
      
      tilastot();
      function tilastot(){
    	  
    	  $.ajax({url: "Servlet_tilastoJson?id="+<%out.print(id);%>+"&length="+labels.length, success: function(result){
 		 data=(Array.from(result));
    		  addData(data);
  	    }});
		
      }

    </script>

  </body>
</html>

