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





        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2 pt-3 pl-3">Calendar</h1>
           
          </div>

          <div class="shadow bg-white m-2 p-2  " id='calendar'></div>
       
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

