<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Driver's Page</title>
    </head>
    <% //In case, if Editor session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Driver") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}%>
    <body>
        <center><h2>Driver's Home</h2></center>

        Welcome <%=request.getAttribute("userName")%>

        <div style="text-align: right"><a href="<%=request.getContextPath()%>/logout">Logout</a></div>

    </body>
</html>
