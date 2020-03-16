<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<title>Welcome to Buspackers Official Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css" />
</head>
<body>


	<div class="container-fluid">

		<div class="navebar" navbar-light" navbar-dark bg-dark></div>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">SuperSafari</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">

					<%
						String signinValue = "Signin";
						try {

							if (session.getAttribute("adminName").toString() != null && session != null) {
								signinValue = session.getAttribute("adminName").toString();
					%>
					<li class="nav-item active ml-auto"><a href="adminProfile.jsp"
						class="nav-link"><b>Welcome </b> <%
 	out.println(signinValue);
 %> </a></li>
					<%
						} else {
					%>
					<li class="nav-item active ml-auto"><a href="signin.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>
					<li class="nav-item active ml-auto"><a href="adminSignin.jsp"
						class="nav-link">Admin</a></li>
					<%
						}
						} catch (Exception ex) {
					%>
					<li class="nav-item active ml-auto"><a href="signin.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>
					<li class="nav-item active ml-auto"><a href="adminSignin.jsp"
						class="nav-link">Admin</a></li>
					<%
						}
					%>
					<li class="nav-item active ml-auto"><a href="scheduleTrip.jsp"
						class="nav-link">Schedule Trip</a></li>
					<li class="nav-item active ml-auto"><a
						href="scheduledTrip.jsp" class="nav-link">Available Trip</a></li>
					<li class="nav-item active ml-auto"><a href="#"
						class="nav-link">History</a></li>



					<li class="nav-item dropdown active ml-auto"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Options</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="adminProfile.jsp">Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout.jsp?logoutValue=1">Logout</a>

						</div></li>

				</ul>

			</div>
		</nav>
	</div>