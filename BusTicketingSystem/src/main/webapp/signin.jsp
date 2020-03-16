<%@page import="user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />
<%
	String temp = null;
	if (request.getParameter("email") != null && request.getParameter("pass") != null) {

		String userEmail = request.getParameter("email");
		String password = request.getParameter("pass");

		//out.println("This email and password is: "+userEmail+"\n "+password);
		Login ob = new Login();

		temp = ob.check_login(userEmail, password);
		//            out.println("This is temp: "+temp);
		if (temp != "No-One") {
			session.setAttribute("userName", temp);
			session.setAttribute("userEmail", userEmail);
			response.sendRedirect("profile.jsp");
		} else {
			//out.print("Login Failed");
		}
	}
%>

<form action="signin.jsp" method="post">


	<div class="form-group col-4">

		<p style="color: red;" align="center">
			<%
				if (temp == "No-One") {
					out.println("Invalid Username or Password.");
				}
			%>
		</p>
		<label for="uname">Email/Username</label> <input type="text"
			placeholder="Enter Username" name="email" class="form-control"
			id="exampleInputEmail1" aria-describedby="emailHelp" required>
		<small id="emailHelp" class="form-text text-muted">We'll never
			share your email with anyone else.</small>
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
