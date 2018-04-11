<%@include file="header.jsp" %>
<%@ page import="model.Order"%>
<% String id = request.getParameter("id"); %>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
 
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '2018-03-12',
      editable: true,
      
      navLinks: true, // can click day/week names to navigate views
      eventLimit: true, // allow "more" link when too many events
      eventColor: '#323741',
      eventTextColor: 'white',
      events: {
        url: 'Servlet_tilauksetJSON?id='+<%out.print(id);%>,
       
        error: function() {
          $('#script-warning').show();
        }
      },
      loading: function(bool) {
        $('#loading').toggle(bool);
      },
      
      dayClick: function(date) {
		var clickDate=date.format();
    	    alert('Clicked on: ' + clickDate);



    	  }
    });

  });

</script>
	
<div class="container-fluid " id="comments">
	<div class=" row mt-5 " >
		<div id ="sidemenu" class="col-md-auto menu   ">
			<ul><a href="main.jsp" alt="Profile">U</a></ul>
			<ul ><a href='#' alt='Users' id='userstn'>G</a></ul >	
			<ul><a href="#" alt="Settings" id="settingsbtn" >Y</a></ul>
			<ul><a href="Servlet_Login?out=1">L</a></ul>
		
</div>

<div class="container  " >

	<div class="row  nav-menu"  >
	<div class="col-3 "></div>	
	<div class="col-md-2  ">Calendar</div>	
	<div class="col-md-2  ">Manage resources</div>
	<div class="col-md-2 ">Company details</div>
	
	</div>
	
	
	
	 <div class="mt-2 pt-3 border-top"id='calendar'></div>
	 <div id="dialog"> </div>
	 
<table class="table table-sm table-hover mt-4 orders">
 <div class="col-md-12 mt-2 table-top">Latest:</div>
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

</div>



</div>

<div class="footer container-fluid pt-3 pb-3 pl-5 pr-0 h-200" ><p>Footer</p>
</div>

</body>

<script type="text/javascript">

	
document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

</html>