
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>User Page</title>
        <link rel="stylesheet" href="bundle.css" type="text/css" />
        <script async src="bundle.js" type="text/javascript"></script>
    </head>

    <body>
        <center><h2>User's Home</h2></center>
        Welcome <%=session.getAttribute("userName")%> (Your Role: <%=session.getAttribute("Role")%>)

        <div style="text-align: right"><a href="<%=request.getContextPath()%>/logout">Logout</a></div>

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" id="text-field-hero-input">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">Name</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

    </body>
</html>