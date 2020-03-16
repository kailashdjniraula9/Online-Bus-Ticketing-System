<%@page import="user.Customer"%>
<%@page import="admin.Trip"%>
<%@page import="java.sql.*"%>
<%@page import="admin.AdminLogin"%>
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

<h1 style="text-align: center;">My Bookings</h1>
<table class="table border border-light" style="color: white; text-align: center;" border="1">
	<tr class="bg-primary">
		<th><p>Booking Id</p></th>
		<th><p>Source</p></th>
		<th><p>Destination</p></th>
		<th><p>Date</p></th>
		<th><p>Time</p></th>
		<th><p>Bus Type</p></th>
		<th><p>Company</p></th>
		<th><p>Seats</p></th>
		<th><p>Operator</p></th>
		<th><p>Fare</p></th>
	</tr>
	<%
		try {
			ResultSet res = ob.profilJourneyHistory(ob.getCustomerEmail());
			while (res.next()) {
	%>
	<tr class="bg-info">
		<td><p><%=res.getString("id")%></p></td>
		<td><p><%=res.getString("source")%></p></td>
		<td><p><%=res.getString("destination")%></p></td>
		<td><p><%=res.getString("date")%></p></td>
		<td><p><%=res.getString("time")%></p></td>
		<td><p><%=res.getString("bus_type")%></p></td>
		<td><p><%=res.getString("company")%></p></td>
		<td><p><%=res.getString("seat_no")%></p></td>
		<td><p><%=res.getString("operator")%></p></td>
		<td><p><%=res.getString("fare")%></p></td>
	</tr>
	<%
		}
		} catch (Exception ex) {
		}
	%>
	<tr>
</table>



<jsp:include page="footer.jsp" />

