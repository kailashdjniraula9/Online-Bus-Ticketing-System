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


<h1 style="text-align: center; color: white;">Search For Buses</h1>
<form action="availableTrip.jsp"
	class="row justify-content-center align-items mt-4">
	<table>
		<tr>
			<td><p style="color: white;">Source</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select placeholder="Trip Source" name="source"
				class="form-control form-control-sm" required>
					<option>Kathmandu</option>
					<option>Lalitpur</option>
					<option>Bhaktapur</option>
					<option>Chitwan</option>
					<option>Mahendranagar</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Destination</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select placeholder="Trip Source" name="destination"
				class="form-control form-control-sm" required>
					<option>Kathmandu</option>
					<option>Lalitpur</option>
					<option>Bhaktapur</option>
					<option>Chitwan</option>
					<option>Mahendranagar</option>

			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Trip Date</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="date" name="date"
				class="form-control form-control-sm" required></td>
		</tr>

		<tr>
			<td><p></p></td>
			<td><p></p></td>

			<td><button type="submit" class="btn btn-success mt-4">Search Now</button></td>
		</tr>

	</table>
</form>


<jsp:include page="footer.jsp" />

