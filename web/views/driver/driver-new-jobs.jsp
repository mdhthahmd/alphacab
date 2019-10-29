<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page ="driver-dashboard.jsp"/>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">email</th>
                <th scope="col">Pick-up Point</th>
                <th scope="col">Drop-off Point</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>ALI</td>
                <td>ali123@hotmail.com</td>
                <td>athamaa Hotel</td>
                <td>Raees Office</td>
            </tr>

        </tbody>
    </table>
    </body>
</html>
