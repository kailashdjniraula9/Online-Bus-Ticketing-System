<%@page import="user.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />


<%
	Customer ob = new Customer();
	try {
		if (session.getAttribute("userName").toString() == null) {
			response.sendRedirect("signin.jsp");
		}
		String email = session.getAttribute("userEmail").toString();
		ob.setCustomerEmail(email);
		ob.userInfo(ob);
	} catch (Exception ex) {
		response.sendRedirect("signin.jsp");
	}
%>


		<h1 style="text-align: center;">
			<%
				out.println(ob.getCustomerName());
			%>'s Profile
		</h1>
		<table class="row justify-content-center align-items mt-4" style="color: white;">
			
			<tr>
				<td><p>Name </p></td>
				<td><p>:</p></td>
				<td><p><%out.println(ob.getCustomerName());%></p></td>

			</tr>
			<tr>
				<td><p>Email</p></td>
				<td><p>:</p></td>
				<td><p><%=ob.getCustomerEmail()%></p></td>

			</tr>
			<tr>
				<td><p>Contact No</p></td>
				<td><p>:</p></td>
				<td><p><%=ob.getCustomerPhone()%></p></td>
			</tr>
			<tr>
				<td><p>Home City</p></td>
				<td><p>:</p></td>
				<td><p><%=ob.getCustomerHomeCity()%></p></td>

			</tr>
			<tr>
				<td><p>Living City</p></td>
				<td><p>:</p></td>
				<td><p><%=ob.getCustomerLivingCity()%></p></td>
			</tr>
			<tr>
				<td><p>Gender</p></td>
				<td><p>:</p></td>
				<td><p><%=ob.getCustomerGender()%></p></td>
			</tr>
		</table>



<jsp:include page="footer.jsp" />

