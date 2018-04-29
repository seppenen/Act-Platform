<%@include file="header.jsp" %>



<% 

String id= request.getParameter("id");

%>


        <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="display-4 h2 pt-3 pl-3">Orders</h1>
           
          </div>

          <table class="table  table-md table-hover mt-4 orders">
	<div class="col-md-12 mt-2 table-top">

	</div>

	<thead class="shadow" style="background-color: rgb(74, 118, 168);">

		<tr style="color: #fff;">
			<th scope="col">#</th>
			<th scope="col">Service</th>
			<th scope="col">Date</th>
			
			<th scope="col">Status</th>
			<th scope="col">Action</th>
		</tr>
	</thead>

	<tbody class="shadow bg-white" id="tilaukset">


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

	$.getJSON("Servlet_tilaukset?id=<% out.print(id);%>", function(result) {
		$.each(result, function(i, field) {

			$("#tilaukset").prepend(
					"<tr><th scope='row'>" + field.id + "</th><td>"
							+ field.title + "</td> <td>"
							+ field.start.toString().substring(0, 10) + " "
							+ field.start.toString().substring(11)+ "</td>  <td>" + field.status+ "</td> <td> View Complete </td></tr>");
		});
	});
      
  
      
    </script>

  </body>
</html>

