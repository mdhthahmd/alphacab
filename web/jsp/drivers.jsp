

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="admin-dashboard.jsp"/>
    </head>
    <body>
        <h1 class="h2">Drivers</h1>

        <a href="http://localhost/cms/admin/users/create.php" class="btn btn-secondary float-right m-2">Add New</a>

        <table class="table table-stripped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td><?php echo $row['UserID'] ?></td>
                    <td><?php echo $row['Name'] ?></td>
                    <td><?php echo $row['Email'] ?></td>                    
                    
                    <td>
                        <div class="btn-group">
                            <a href="http://localhost/cms/admin/users/edit.php?id=<?php echo $row['UserID'] ?> " class="btn btn-primary">Edit</a>
                            <a href="http://localhost/cms/admin/users/destroy.php?id=<?php echo $row['UserID'] ?> " class="btn btn-danger">Delete</a>                        
                        </div>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </body>
</html>
