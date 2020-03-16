<%@page import="user.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%
	boolean mismatchPassword = false;
	String userName = "Enter name";
	String userEmail = "Enter Email";
	String password = "Password";
	String rePassword = "Retype Password";
	String userPhone = "11 Digit Mobile No";
	String userGender = null;
	String userHomeCity = "Home City";
	String userLivingCity = "Living City";
	if (request.getParameter("email") != null && request.getParameter("pass") != null
			&& request.getParameter("repass") != null && request.getParameter("phone") != null) {

		userName = request.getParameter("name");
		userEmail = request.getParameter("email");
		password = request.getParameter("pass");
		rePassword = request.getParameter("repass");
		userPhone = request.getParameter("phone");
		userGender = request.getParameter("gender");
		userHomeCity = request.getParameter("homecity");
		userLivingCity = request.getParameter("livingcity");

		out.println("Password: " + password);
		out.println("RE-Password: " + rePassword);

		if (password == rePassword) {
			mismatchPassword = true;
			out.println("Mismatch Password: " + mismatchPassword);
		} else {

			out.println("This email and password is: " + userEmail + "\n " + password);
			Login ob = new Login();

			String temp = ob.Customer_signup(userName, userEmail, password, userPhone, userGender, userHomeCity,
					userLivingCity);

			if (temp == "Registration successful") {
				response.sendRedirect("signin.jsp");
			} else {
				out.print("Login Failed");
			}
		}
	}
%>

<form action="" class="row justify-content-center align-items mt-4">

	<table>
		<tr>
			<td><p style="color: white;">Full Name</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" placeholder="Enter your First Name" class="form-control form-control-sm"
				name="name" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Email</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" placeholder="Enter your Email Address"  class="form-control form-control-sm"
				name="email" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Country</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select placeholder="Enter region" name="country" class="form-control form-control-sm" >
					<option>Bangladesh</option>
					<option>India</option>
					<option>Pakistan</option>
					<option>U.S.A</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Phone Number</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" placeholder="<%out.println(userPhone);%>" class="form-control form-control-sm"
				name="phone" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Permanent Address</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" value="<%out.println(userHomeCity);%>" class="form-control form-control-sm"
				name="homecity" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Current Address</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" value="<%out.println(userLivingCity);%>" class="form-control form-control-sm"
				name="livingcity" required><br></td>
		</tr>
		<tr>
			<td><p style="color: white;">Gender</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="radio" name="gender" value="Male" > Male
				<input type="radio" name="gender" value="Female"> Female <input
				type="radio" name="gender" value="others"> Other's</td>
		</tr>
		<tr>
			<td><p style="color: white;">Password</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="password" placeholder="Enter Password" class="form-control form-control-sm"
				name="pass" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">ReEnter Password</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="password" placeholder="Re Enter Password" class="form-control form-control-sm"
				name="repass" required></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>

			<td><button type="submit" class="btn btn-info mt-4">Submit</button></td>
		</tr>

	</table>


</form>

<jsp:include page="footer.jsp" />
