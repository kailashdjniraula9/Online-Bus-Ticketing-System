<%@page import="admin.AdminLogin"%>
<%@page import="user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />

<%
	String temp = null;
	if (request.getParameter("email") != null && request.getParameter("pass") != null) {

		String adminEmail = request.getParameter("email");
		String adminPassword = request.getParameter("pass");

		//out.println("This email and password is: "+userEmail+"\n "+password);
		AdminLogin ob = new AdminLogin();

		temp = ob.check_login(adminEmail, adminPassword);
		String check = "No-One";
		//            out.println("This is temp: "+temp);
		if (temp.compareTo(check) != 0) {
			session.setAttribute("adminName", temp);
			session.setAttribute("adminEmail", adminEmail);
			response.sendRedirect("adminProfile.jsp");
		} else {
			//out.print("Login Failed");
		}
	}
%>

<form action="adminSignin.jsp" method="post">


	<div class="form-group col-4">

		<p style="color: red;" align="center">
			<%
				if (temp == "No-One") {
					out.println("Invalid Username or Password.");
				}
			%>
		</p>
		<label for="uname">Admin Email</label> <input type="text"
			placeholder="Admin Email" name="email" class="form-control"
			id="exampleInputEmail1" aria-describedby="emailHelp" required>
		<small id="emailHelp" class="form-text text-muted">We'll
			never share your email with anyone else.</small>
	</div>
	<div class="form-group col-4">
		<label for="psw">Password</label> <input type="password"
			class="form-control" id="exampleInputPassword1" name="pass" required />
	</div>
	<div class="form-group form-check col-4">
		<input type="checkbox" class="form-check-input ml-1"
			id="exampleCheck1"> <label class="form-check-label ml-4"
			for="exampleCheck1" style="color: white;">Remember Me</label>
	</div>
	<div class="form-group form-check col-4 mb-4"
		style="text-align: center;">
		<button type="submit" class="btn btn-primary">Login</button>
		<a type="button" href="signup.jsp" class="btn btn-info">SignUp</a>

	</div>



</form>


<jsp:include page="footer.jsp" />
