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

<%
	if (request.getParameter("updateProfile") != null) {
		String editName = request.getParameter("editName");
		String editEmail = request.getParameter("editEmail");
		String editPassword = request.getParameter("editPassword");
		String editGender = request.getParameter("editGender");
		String editLivingCity = request.getParameter("editLivingCity");
		String editHomeCity = request.getParameter("editHomeCity");
		String editPhone = request.getParameter("editPhone");
		String id = ob.getCustomerId();

		boolean ensureUpdate = ob.updateProfile(id, editName, editEmail, editPassword, editPhone, editGender,
				editLivingCity, editHomeCity);
		if (ensureUpdate == true) {
			out.println("Sucessfully Updateaed data");
			response.sendRedirect("profile.jsp");
		} else {
			out.println("There was a problem to update your data.");
		}
	}
%>



<form action="" class="row justify-content-center align-items mt-4">

	<table>
		<tr>
			<td><p style="color: white;">Name</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" name="editName"
				class="form-control form-control-sm" size="25"
				value="<%out.println(ob.getCustomerName());%>" /></td>
		</tr>
		<tr>
			<td><p style="color: white;">Email</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" name="editEmail"
				class="form-control form-control-sm" size="25"
				value="<%=ob.getCustomerEmail()%>" /></td>
		</tr>
		<tr>
			<td><p style="color: white;">Contact No</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" name="editPhone"
				class="form-control form-control-sm" size="25"
				value="<%=ob.getCustomerPhone()%>" /></td>
		</tr>
		<tr>
			<td><p style="color: white;">New Password</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="password" name="editPassword"
				class="form-control form-control-sm" size="25"
				Placeholder="Enter New Password" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Home City</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" name="editHomeCity"
				class="form-control form-control-sm" size="25"
				value="<%=ob.getCustomerHomeCity()%>" /></td>
		</tr>
		<tr>
			<td><p style="color: white;">Living City</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" name="editLivingCity"
				class="form-control form-control-sm" size="25"
				value="<%=ob.getCustomerLivingCity()%>" /></td>
		</tr>
		<tr>
			<td style="color: white;"><p>Gender</p></td>
			<td style="color: white;"><p>:</p></td>
			<td style="color: white;"><input type="text"
				class="form-control form-control-sm" size="25"
				value="<%=ob.getCustomerGender()%>" readonly="readonly" /></td>

		</tr>

		<tr>
			<td><p style="color: white;">Update Gender</p></td>
			<td><p style="color: white;">:</p></td>
			<td style="color: white;"><input type="radio" name="editGender"
				value="Male" required="required"> Male <input type="radio"
				name="editGender" value="Female"> Female <input type="radio"
				name="editGender" value="others"> Other's</td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><input type="hidden" name="updateProfile" value="true" /></td>
			<td><input type="submit" class="btn btn-info mt-2"
				value="Update" /></td>
		</tr>
	</table>
</form>



<jsp:include page="footer.jsp" />

