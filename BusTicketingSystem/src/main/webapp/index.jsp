
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%
	if (session != null) { //Condition for navigation bar
		if (session.getAttribute("userName") != null) {
%>

<%
	} else if (session.getAttribute("adminName") != null) {
%>
<%
	}
	} // End of navigation condition
%>

<div class="content">

	<h1
		style="text-align: Center; font-family: sans-serif; font-size: 140px;">SuperSafari</h1>
	<p
		style="text-align: center; font-family: cursive; margin: 0; padding: 0; font-size: 60px;">A
		Safe Journey to Destination</p>
</div>

<jsp:include page="footer.jsp" />