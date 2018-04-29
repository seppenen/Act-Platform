
<%@ page import="model.Company"%>


<%@include file="header.jsp"%>

<%
	Company company = null;
	if (request.getAttribute("company") != null) {
		company = (Company) request.getAttribute("company");
	}
%>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

<main role="main" class=" col-md-9 ml-sm-auto col-lg-10 pt-3 ml-1  px-4">


<div
	class="d-flex cal justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom ">
	<h1 class="display-4 h2 pl-3 pt-3 ">${company.getName()}</h1>

</div>

<ul class="nav cal nav-pills pb-1">
	<li class="nav-item"><a class="nav-link report " href="#">General</a>
	</li>
	<li class="nav-item"><a class="nav-link report" href="orders.jsp?id=${company.getId()}">Orders</a>
	</li>
	<li class="nav-item"><a class="nav-link report" href="#">Clients</a>
	</li>

</ul>
<div class=" mb-3 bg-white shadow">

	<form action="Servlet_editCompany" method="post" id="editCompany"
		class="   p-3  mx-auto">
		<div class=" form-group">
			<label for="title">Full Name</label> <input class="form-control"
				name="name" id="name" value="${company.getName()}">
		</div>
		<div class=" form-group">
			<label for="title">Alias</label> <input class="form-control"
				name="alias" id="alias" value="${company.getAlias()}">
		</div>
		<div class=" form-group">
			<label for="title">Phone</label> <input class="form-control"
				name="phone" id="phone" value="${company.getPhone()}">
		</div>
		<div class=" form-group ">
			<label for="price">Address</label>
			<div class="autocomplete">
				<input class="form-control col-md-auto" name="address" id="address"
					value="${company.getAddress()}">
			</div>
		</div>

		<div class=" form-group">
			<label for="availiblity">Open hours</label>

			<div class="form-row ">
				<div class="col-md-2  ">
					<input class="form-control" name="from" id="from"
						placeholder="From">
				</div>
				<label for=""> - </label>
				<div class="col-md-2">
					<input class="form-control" name="to" id="to" placeholder="To">
				</div>
				<div class="col-md-auto">

					<select class="form-control" name="day" id="day">

						<option value="Monday">Monday</option>
						<option value="Tuesday">Tuesday</option>
						<option value="Wednesday">Wednesday</option>
						<option value="Thursday">Thursday</option>
						<option value="Friday">Friday</option>
						<option value="Saturday">Saturday</option>
						<option value="Sunday">Sunday</option>
					</select>
				</div>

				<div class="col-md-auto">
					

					<button class="btn btn-primary btn-md " id="add_day" name="add_day"
						type="button">Add</button>
				</div>


			</div>
			<div id="date_error" style="color: red;"></div>
		</div>

		<div id="openhours" class="form-group"></div>

		<div class="form-group">
			<label>Description</label>
			<textarea class="form-control" name="description" id="description"
				rows="4">${company.getDescription()}</textarea>
		</div>

<input type="hidden" id="business_id" name="business_id" value="${company.getId()}">
		<input type="hidden" id="lat" name="lat" value=""> 
		<input type="hidden" id="lng" name="lng" value=""> 
			<input type="hidden" id="user" name="user" value="${session.getId()}">


	</form>

	<p class="mb-3 pl-3" id="result"></p>

	<div class=" form-group">
		<button class="m-3 btn btn-primary btn-md " id="submit" type="button">Submit</button>

	</div>
	<div class="p-3 form-group">

		<button type="button" data-toggle="modal" data-target="#modal"
			class=" btn btn-danger btn-md btn-block">Delete this company</button>
	</div>
</div>
</div>
</div>
</main>
</div>


<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Delete
					${company.getName()}</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">I understand the consequences delete
				this company</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="delete_company" data-dismiss="modal"
					class="btn btn-danger">Delete</button>
			</div>
		</div>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
	feather.replace()
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYGmROPS0aVzBLHXoT1zWHEpIipah9w2A&libraries=places&callback=initAutocomplete" async defer></script>



<script>

 function initAutocomplete() {
    
	new google.maps.places.Autocomplete((document.getElementById('address'))); 
     
    }
	function listaTunnit() {

		$.getJSON("Servlet_listatunnit?id=${company.getId()}&param=business_id&table=hours",function(result) {
			 if (result==""){
	  			 
		  			listaTunnit()
		  		 }
		$.each(result,function(i, field) {

		$("#openhours").append("<div id='openhour' class='pt-3 form-row'><div class='col-md-2'>"+ field.day+ ": </div><div class='col-md-2'> "+ field.start+ " - "+ field.end+ "</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="+field.id+" id='delete' title="+field.day+" type='button' >Delete</button></div></div>");
						});
						});
	}

	function addError(data, day) {

		if (data.length == "0") {
			$("#date_error").text(day + " already exist.");
		} else {

			$("#openhours")
					.append(
							"<div id='openhour' class='pt-3 form-row'><div class='col-md-2'>"
									+ $("#day").val()
									+ ": </div><div class='col-md-2'> "
									+ $("#from").val()
									+ " - "
									+ $("#to").val()
									+ "</div> <div class='col-md-2'><button class=' btn btn-primary btn-sm' value="
									+ data
									+ " id='delete' title="
									+ $("#day").val()
									+ " type='button' >Delete</button></div></div>");

		}

	}

	
	  function geocode(){
	    	
	    	var a=$.Deferred();
	   
	    	var location=$('#address').val(); 	
	    	
	    	$.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='+location+'&key=AIzaSyDYGmROPS0aVzBLHXoT1zWHEpIipah9w2A', function(response){
	    		
	    	var lat = response.results[0].geometry.location.lat;
	    	var lng = response.results[0].geometry.location.lng;
	    	
	    	console.log(lat+ " "+lng);
	    	
	    	if(lat!="" && lng!=""){    		
	    	
	    	$("#lat").val(lat);
	    	$("#lng").val(lng);

	    	a.resolve();
	    	
	    	}else{
	    		
	    		geocode();
	    		
	    	}
	    	})

	    	return a;
	    	
	    	}
	    
	  
	  
	$("#add_day").click(function() {
		$("#date_error").text("");

		var from = $("#from").val();
		var to = $("#to").val();
		var day = $("#day").val();
		var business_id = $("#business_id").val();
		if (from != "" && to != "") {

			$.ajax({
				type : "POST",
				url : "Servlet_listatunnit?s=1&temp=0",
				data : {
					from : from,
					to : to,
					day : day,
					business_id : business_id
				},
				success : function(data) {
					console.log(data.trim().length);
					addError(data.trim(), day);

				}
			});
		} else {
			$("#date_error").text("Time is required.");
		}

	});

	$(document).on('click', '#delete', function(event) {

		var id = $(this).val();
		$(this).parents('#openhour').remove();

		$.ajax({
			type : "GET",
			url : "Servlet_poistaTunti?s=1&id=" + id,

			success : function(data) {

			}
		});

	});

	$("#delete_company").click(function() {

		$.ajax({
			type : "GET",
			url : "Servlet_deleteRow?param=1&id=" + $("#business_id").val(),

			success : function() {

				document.location = "dash.jsp";

			}
		});

	});

	$("#spinner").hide();

	$(document).ready(function() {
		$('#to').timepicker({
			timeFormat : 'HH:mm',
			interval : 15
		});
		$('#from').timepicker({
			timeFormat : 'HH:mm',
			interval : 15
		});
	});

	$('#submit').click(function() {

		if ($("#editCompany").valid()) {

			const coords = geocode();

			coords.done(function() {
				console.log("coords.done");
				
				
				$.ajax({
					type : "POST",
					url : "Servlet_editCompany",
					data : $('#editCompany').serialize(),
					success : function() {

						$("#result").text("Saved!");
						
						

					}
				});
			});

		}

	});

	$("#editCompany").validate({
		errorClass : 'errors',
		rules : {

			name : {
				required : true
			},

			alias : {
				required : true,
				minlength : 2
			},
			phone : {
				required : true,
				number : true,
			},

			address : {
				required : true,

			},

			description : {
				required : true,
				minlength : 2
			}
		},
		messages : {
			name : {
				required : "This field is required.",
			},
			alias : {
				required : "This field is required.",

			},
			phone : {
				required : "This field is required.",
				number : "Must be a number"
			},
			address : {
				required : "This field is required.",

			},
			description : {
				required : "This field is required.",

			}
		}

	});

	$(document).ready(function() {
		listaTunnit();
	});
</script>

</body>
</html>

