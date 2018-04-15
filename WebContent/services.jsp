<%@include file="header.jsp" %>

<body class="bg-light">
 
<div class="container-fluid hat sticky-top"> <h3>TARGO</h3></div>
    <div class="container bg-light">
      <div class="row ">
        <nav class="bg-light col-md-2 sidebar">
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
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 ">
            <h1 class="h2 pl-3 pt-3">Services</h1>
           
          </div>
          <form class="pl-3 mb-3 form-inline ">
      <input class="form-control col-md-auto " type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
<div id="servicecards" class="col-md-auto mx-auto">
  

</div>

       
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
    	
    	 $(document).on('mouseover', '.item-box', function(event) {
            alert(this.id);
       });

    $.getJSON("Servlet_services", function(result){
    	
        $.each(result, function(i, field) { 
        
        	
         $("#servicecards").append("<div id='"+field.service_id+"' class=' item-box card mb-3'><img  class='service-item-hover card-img-top' src='images/uploads/"+field.picture+"' alt='Card image cap'> <div class='card-body '><h5 class='card-title'>"+field.title+"</h5></div></div>");
     });
 });

    });
    
  
      
    </script>

  </body>
</html>

