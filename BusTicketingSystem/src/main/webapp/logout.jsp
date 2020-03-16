<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String  logoutValue = request.getParameter("logoutValue");
        session.invalidate();
        response.sendRedirect("index.jsp");
%>
