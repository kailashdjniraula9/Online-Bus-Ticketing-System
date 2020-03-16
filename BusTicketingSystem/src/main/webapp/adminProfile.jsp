<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="adminHeader.jsp" />

<%
	AdminLogin ob = new AdminLogin();
	try {
		if (session.getAttribute("adminName").toString() == null) {
			response.sendRedirect("adminSignin.jsp");
		}
		String email = session.getAttribute("adminEmail").toString();
		ob.setAdminEmail(email);
		ob.userInfo(ob);
	} catch (Exception ex) {
		response.sendRedirect("adminSignin.jsp");
	}
%>

<div class="alert alert-success container mt-4" role="alert">
	<h4 class="alert-heading" style="text-align: center;">Welcome to
		the admin home page!!!</h4>
	<p>Aww yeah, you successfully read this important alert message.
		This example text is going to run a bit longer so that you can see how
		spacing within an alert works with this kind of content.</p>
	<hr>
	<p class="mb-0">Whenever you need to, be sure to use margin
		utilities to keep things nice and tidy.</p>


</div>

<div class="container">
	<div class="row">
		<div class="col-sm">
			<div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
				<div class="card-header">Schedule Trip</div>
				<div class="card-body">
					<h5 class="card-title" style="text-align: center;">Add a new
						Trip!!!</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
				<div class="card-footer bg-transparent border-danger">
					<a href="scheduleTrip.jsp" class="btn btn-light" role="button"
						aria-pressed="true">Add Trip</a>
				</div>
			</div>
		</div>
		<div class="col-sm">
			<div class="card text-white bg-success mb-3"
				style="max-width: 18rem;">
				<div class="card-header">Available Trip</div>
				<div class="card-body">
					<h5 class="card-title" style="text-align: center;">See
						Available Trips!!!</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
				<div class="card-footer bg-transparent border-success">
					<a href="scheduledTrip.jsp" class="btn btn-light " role="button"
						aria-pressed="true">View Trips</a>
				</div>
			</div>
		</div>
		<div class="col-sm">
			<div class="card text-white bg-warning mb-3"
				style="max-width: 18rem;">
				<div class="card-header">Profie</div>
				<div class="card-body">
					<h5 class="card-title" style="text-align: center;">Update Your
						Profile!!!</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
				<div class="card-footer bg-transparent border-warning">
					<a href="#" class="btn btn-light " role="button"
						aria-pressed="true">Update Profile</a>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp" />