
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>User Page</title>
</head>

<body>
    <center><h2>User's Home</h2></center>
    Welcome <%=session.getAttribute("userName") %> (Your Role: <%=session.getAttribute("Role")%>)
 
    <div style="text-align: right"><a href="<%=request.getContextPath()%>/logout">Logout</a></div>
 
    </body>
</html>