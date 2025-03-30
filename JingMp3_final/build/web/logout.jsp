<%-- 
    Document   : logout
    Created on : Oct 24, 2024, 3:58:13 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
   
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("home.jsp");
%>
    </body>
</html>
