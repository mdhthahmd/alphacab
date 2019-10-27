<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <jsp:include page="admin-dashboard.jsp"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v3.8.5">
        <title>Dashboard Template · Bootstrap</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="dashboard.css"  type="text/css" rel="stylesheet">


    </head>
    <body>

        <!--have to require header-->

        <h1 class="h2">Create New Driver</h1>

        <form action="#" method="POST">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="btn-group">
                <button class="btn btn-primary">Save</button>
                <a href="#" class="btn btn-danger">Cancel</a>
            </div>
        </form>
    </body>
</html>



<!-- have to require footer -->