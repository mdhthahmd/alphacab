<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
        <script>
            function validate()
            {
                var username = document.form.email.value;
                var password = document.form.password.value;

                if (username == null || username == "")
                {
                    alert("Username cannot be blank");
                    return false;
                } else if (password == null || password == "")
                {
                    alert("Password cannot be blank");
                    return false;
                }
            }
        </script> 
    </head>
    <body>
        <div style="text-align:center"><h1>Alpha Cab Login</h1> </div>
        <br>
        <form name="form" action="<%=request.getContextPath()%>/login" method="post" onsubmit="return validate()">
            <table align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr> 
                            <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"></input><input
                            type="reset" value="Reset"></input></td>
                </tr>
            </table>
        </form>

    </body>
</html>