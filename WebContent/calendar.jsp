<%@include file="header.jsp" %>



<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
 
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      firstDay: 1,
      
      editable: true,
      
      navLinks: true, // can click day/week names to navigate views
      eventLimit: true, // allow "more" link when too many events
      eventColor: '#4682B4',
      eventTextColor: 'white',
      events: {
        url: 'Servlet_calendar',
       
        error: function() {
         
        }
      },
      loading: function(bool) {
        $('#loading').toggle(bool);
      },
      
      dayClick: function(date) {
		var clickDate=date.format();
    	    alert('Clicked on: ' + clickDate);

    	  },

      eventClick: function(calEvent, jsEvent, view) {

    	    alert('Event: ' + calEvent.title+" "+calEvent.id);

    	  }
    	  
 
    });

  });

</script>




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
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2 pt-3 pl-3">Calendar</h1>
           
          </div>

          <div class="bg-white p-2 border" id='calendar'></div>
       
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

 
      
      $(".report").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });

      
      
    </script>

  </body>
</html>

