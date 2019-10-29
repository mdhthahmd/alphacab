package com.alphacab.dao;

 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.alphacab.model.LoginBean;
import com.alphacab.database.ConnectionManager;



public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String passwordDB = "";
        String userNameDB = "";
        String roleDB = "";

        try {
            connection = ConnectionManager.createConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select email,password,userRole,userName from users");

            while (resultSet.next()) {
                emailDB = resultSet.getString("email");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("userRole");
                userNameDB = resultSet.getString("userName");

                
                
                if (email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("Admin")) {
                    loginBean.setUserName(userNameDB);
                    return "Admin_Role";
                } else if (email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("Driver")) {
                    loginBean.setUserName(userNameDB);
                    return "Driver_Role";
                } else if (email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("Customer")) {
                    loginBean.setUserName(userNameDB);
                    return "Customer_Role";
                }
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
