<%@page import="user.Booking"%>
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

<%
	String tripId = request.getParameter("tripId");
	Booking bp = new Booking();
	try {
		ResultSet res = bp.Seats(tripId);
%>


<h1 style="text-align: center;">Selected Bus Infromation</h1>
<form action="ticket.jsp">
	<table class="table border border-light"
		style="color: white; text-align: center;" border="1">
		<tr class="bg-primary">
			<th><p>Trip Id</p></th>
			<th><p>Source</p></th>
			<th><p>Destination</p></th>
			<th><p>Journey Date</p></th>
			<th><p>Time</p></th>
			<th><p>Bus Type</p></th>
			<th><p>Company</p></th>
			<th><p>Available Seat</p></th>
			<th><p>Operator</p></th>
			<th><p>Fare</p></th>
		</tr>
		<%
			Trip tp = new Trip();
				try {
					ResultSet tripRes = tp.findTripById(tripId);
					while (tripRes.next()) {
		%>
		<tr class="bg-info">
			<td><p><%=tripRes.getString("id")%></p></td>
			<td><p><%=tripRes.getString("source")%></p></td>
			<td><p><%=tripRes.getString("destination")%></p></td>
			<td><p><%=tripRes.getString("date")%></p></td>
			<td><p><%=tripRes.getString("time")%></p></td>
			<td><p><%=tripRes.getString("bus_type")%></p></td>
			<td><p><%=tripRes.getString("company")%></p></td>
			<td><p><%=tripRes.getString("available_seat")%></p></td>
			<td><p><%=tripRes.getString("operator")%></p></td>
			<td><p><%=tripRes.getString("fare")%></p></td>
		</tr>
		<%
			}
				} catch (Exception ex) {
				}
		%>

	</table>
	<h2 style="text-align: center;">Seat Orientation</h2>

	<div class="availableTripContent">
		<div class="availableTripInfo">
			<table class="table border border-light container col-4"
				style="color: white; text-align: center;" border="1"
				style="margin-left: 30%; border-radius: 5px; font-family: verdana;">
				<%
					String status = null;
						String seat_no = null;
						String temp = "Not-Sold";
						int i = 0;
						int j = 1;
						while (res.next()) {
							if (i % 4 == 0) {
				%>
				<tr>
					<%
						}
								status = res.getString("customer_email");
								seat_no = res.getString("seat_no");
					%>
					<td style="padding: 20px; font-size: 30px;">
						<p>
							<%
								if (status.compareTo(temp) == 0) {
							%>
							<label style="border: 3px solid; color:"><input
								type="checkbox" name="seat" value="<%=seat_no%>"opacity:0.5;">
								<%=seat_no%></label>
							<%
								} else {
							%>
							<span
								style="color: #cb4335; botder-color: #ec7063; border: 3px solid; background-color: #f2d7d5;"><%=seat_no%></span>
						</p>
					</td>
					<%
						}
								if (j % 4 == 0) {
					%>
				</tr>
				<%
					}
							i++;
						} //end of while 
					} catch (Exception ex) {
						out.println(ex);
					}
				%>
				<tr>
					<td colspan="4"><button type="submit" type="button" class="btn btn-success">Confirm</button></td>

				</tr>

			</table>
		</div>
	</div>
	<input type="hidden" name="tripId" value="<%=tripId%>">

</form>




<jsp:include page="footer.jsp" />
