<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AlphaCab - The Best Ride in Town</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <h1>Welcome to AlphaCab - The Best Ride In Town</h1>
        <p>To Experience the Serivce Please Register</p> 
        <form name="register" action="register" method="get">
            <input type="submit" value="Register"></input>
        </form>
        <p>or if you have an account already login</p>
        <form name="login" action="login" method="get">
            <input type="submit" value="Login"></input>
        </form>
    </body>
</html>
