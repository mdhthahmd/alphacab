package com.alphacab.dao;

 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import com.alphacab.model.LoginBean;
import com.alphacab.database.ConnectionManager;
//import org.apache.derby.iapi.sql.PreparedStatement;



public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();

        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
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
                    setCustomerID(connection,preparedStatement,resultSet,loginBean,email);
                    return "Customer_Role";
                }
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
    
    private void setCustomerID(Connection connection,PreparedStatement preparedStatement, ResultSet resultSet,LoginBean loginBean,String email)
    {
        try{
            connection = ConnectionManager.createConnection();
            String query = "SELECT * FROM Customer WHERE email = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                loginBean.setCustomerID(resultSet.getInt("id"));
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
