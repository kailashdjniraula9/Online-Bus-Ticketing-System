<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*"%>
<!doctype html>
<html lang="en">
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
	<div class="container-fluid pl-0 pr-0">

		<div class="navebar navbar-light"></div>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.jsp">SuperSafari</a>
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

							if (session.getAttribute("userName").toString() != null && session != null) {
								signinValue = session.getAttribute("userName").toString();
					%>
					<li class="nav-item active ml-auto"><a href="index.jsp"
						class="nav-link ">Home &nbsp;</a></li>
					<li class="nav-item active"><a href="profile.jsp"
						class="nav-link"> <b>Welcome </b>
							<%
								out.println(signinValue);
							%>
					</a></li>

					<li class="nav-item active"><a href="selectJourney.jsp"
						class="nav-link">Book Ticket</a></li>
					<li class="nav-item active"><a href="editProfile.jsp"
						class="nav-link">Edit Profile</a></li>
					<li class="nav-item active"><a href="cancelTicket.jsp"
						class="nav-link">Cancel Ticket</a></li>
					<li class="nav-item active"><a href="profileHistory.jsp"
						class="nav-link">My Bookings</a></li>
					<li class="nav-item active"><a href="logout.jsp?logoutValue=1"
						class="nav-link">Logout</a></li>
					<%
						} else if (session.getAttribute("adminName").toString() != null && session != null) {
								signinValue = session.getAttribute("adminName").toString();
					%>
					<li class="nav-item active"><a href="adminProfile.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>
					<%
						} else {
					%>
					<li class="nav-item active"><a href="signin.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>

					<li class="nav-item active"><a href="signup.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>
					<li class="nav-item active"><a href="adminSignin.jsp"
						class="nav-link">Admin &nbsp;</a></li>

					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
					<%
						}
						} catch (Exception ex) {
					%>
					<li class="nav-item active"><a href="signin.jsp"
						class="nav-link"> <%
 	out.println(signinValue);
 %>
					</a></li>

					<li class="nav-item active"><a href="signup.jsp"
						class="nav-link">SignUp </a></li>
					<li class="nav-item active justify-content-end"><a
						href="adminSignin.jsp" class="nav-link">Admin</a></li>

					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
					<%
						}
					%>

				</ul>

			</div>
		</nav>
	</div>