<%@include file="header.jsp" %>



        
   <main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">
          <div class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom pb-2 mb-3 ">
            <h1 class="display-4 h2 pl-3 pt-3">Services</h1>
           
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
    	
    	 $(document).on('click', '.item-box', function(event) {
    		 document.location="Servlet_editService?id="+this.id;
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

