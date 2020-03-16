<%@page import="admin.Trip"%>
<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />


<%
	Trip ob = new Trip();
	String tripId = null;
	try {
		tripId = request.getParameter("editTripId");
		if (session.getAttribute("adminName").toString() == null) {
			response.sendRedirect("adminSignin.jsp");
		}
		String email = session.getAttribute("adminEmail").toString();
	} catch (Exception ex) {
		response.sendRedirect("adminSignin.jsp");
	}
%>

<%
	//////////// Update profile
	ob.setTripId(tripId);
	ob.setValue(ob);
	if (request.getParameter("editSchedule") != null) {
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String busType = request.getParameter("busType");
		String busBrand = request.getParameter("busBrand");
		String availableSeat = request.getParameter("availableSeat");
		String operator = request.getParameter("busOperator");
		String fare = request.getParameter("fare");

		boolean ensureSchedule = ob.editScheduler(ob.getTripId(), source, destination, date, time, busType,
				busBrand, availableSeat, operator, fare);
		if (ensureSchedule == true) {
			out.println("Sucessfully Updated data");
			response.sendRedirect("scheduledTrip.jsp");
		} else {
			out.println("There was a problem to update your data.");
		}
	}
%>

<h1 style="text-align: center; color: white;">Edit Scheduled Trip</h1>
<form action="editTrip.jsp"
	class="row justify-content-center align-items mt-4">
	<table>
		<tr>
			<td><p style="color: white;">Source</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select placeholder="Trip Source" name="source" value=""
				class="form-control form-control-sm" required>
					<option><%=ob.getTripSource()%></option>
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
				value="" class="form-control form-control-sm" required>
					<option><%=ob.getTripDestination()%></option>
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
			<td><input type="date" name="date" value="<%=ob.getTripDate()%>"
				class="form-control form-control-sm" required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Trip Time</p></td>
			<td><p style="color: white;">:</p></td>
			<td><input type="text" placeholder="Hour.Min" name="time"
				value="<%=ob.getTripTime()%>" class="form-control form-control-sm"
				required></td>
		</tr>
		<tr>
			<td><p style="color: white;">Bus Type</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select placeholder="AC/Non-AC" name="busType" value=""
				class="form-control form-control-sm" required>

					<option><%=ob.getTripBusType()%></option>
					<option>AC</option>
					<option>Non-AC</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Bus Brand</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select name="busBrand" class="form-control form-control-sm"
				value="" required>
					<option><%=ob.getTripBusBrand()%></option>
					<option>Hino 1J Plus</option>
					<option>Volvo</option>
					<option>Hyundai Universe</option>
					<option>Scania</option>
					<option>Marcedez Benz</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Available Seat</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select name="availableSeat"
				class="form-control form-control-sm" value="" required>
					<option><%=ob.getTripAvailableSeat()%></option>
					<option>12</option>
					<option>9</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Bus Operator</p></td>
			<td><p style="color: white;">:</p></td>
			<td><select name="busOperator"
				class="form-control form-control-sm" value="" required>
					<option><%=ob.getTripBusOperator()%></option>
					<option>Hanif Enterprise</option>
					<option>S.R Travels (Pvt) Ltd</option>
					<option>Shyamoli Poribahan</option>
					<option>Green Line</option>
					<option>Nabil Paribahan</option>
					<option>National Travels</option>
					<option>Desh Travels</option>
					<option>Ena Transport</option>
			</select></td>
		</tr>
		<tr>
			<td><p style="color: white;">Per Seat Fare :</p></td>
			<td><input type="hidden" name="editSchedule" value="true"></td>
			<td><input type="hidden" name="editTripId"
				value="<%=ob.getTripId()%>"> <input type="text"
				value="<%=ob.getTripFare()%>" name="fare"  class="form-control form-control-sm" required></td>

		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>

			<td><button type="submit" class="btn btn-info mt-4">Update</button></td>
		</tr>

	</table>
</form>



<jsp:include page="footer.jsp" />

