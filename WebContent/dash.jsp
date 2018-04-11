<%@include file="header.jsp" %>



 <body class="bg-light">
  <div class="container-fluid hat sticky-top"> <h3>TARGO</h3></div>
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

  		 <div id="servicedrop" class="sub-class ">
  		<ul class="nav flex-column">
  		<li> <a class="nav-link" href="newService.jsp">Add service</a></li>
  		<li> <a class="nav-link" href="services.jsp">Modify service</a></li>  
  		</ul></div>
  		 
              </li>
              <li class="nav-item" id="customers">
                <a class="nav-link" href="users.jsp">
                  <span data-feather="users"></span>
                  Customers
                </a>
                
                 <div id="customerdrop" class="sub-class ">
  		<ul class="nav flex-column">
  		<li> <a class="nav-link" href="newService.jsp">El Medano</a></li>
  		<li> <a class="nav-link" href="services.jsp">Kite surf school</a></li> 
  		<li> <a class="nav-link" href="services.jsp">Some company</a></li> 
  		</ul></div>
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

        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
       <h2 class="pl-3 pt-3">Dashboard</h2>    
       
        <ul class="nav nav-pills pt-1">
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
          <canvas class=" shadow bg-white " id="myChart" ></canvas>
         
          <table class="table  table-md table-hover mt-4 orders">
 		<div class="col-md-12 mt-2 table-top"><h2>Latest Activity</h2></div>
        
         <thead style="background-color:rgb(74, 118, 168);">

    <tr style="color:#fff;">
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
  <tbody class="border bg-white" id="tilaukset">


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
    	  
  var color=['Red', 'rgb(74, 118, 168)', 'Purple', 'Yellow','green', 'black','pink'];
    	
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
                          
                           $("#tilaukset").prepend("<tr><th scope='row'>"+field.id+"</th><td>"+field.title+"</td> <td>"+field.start.toString().substring(0, 10)+" "+field.start.toString().substring(11)+"</td><td>"+field.status+"</td> <td> View Complete </td></tr>");
                      });
                  });
      		

    </script>

  </body>
</html>

