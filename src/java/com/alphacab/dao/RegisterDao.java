/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.alphacab.model.RegisterBean;
import com.alphacab.database.ConnectionManager;
import com.alphacab.model.LoginBean;
import java.sql.ResultSet;



public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {
        String fullName = registerBean.getFullName();
        String email = registerBean.getEmail();
        String userName = registerBean.getUserName();
        String password = registerBean.getPassword();
        String address = registerBean.getAddress();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = ConnectionManager.createConnection();
            String query = "insert into Customer(Name,Address,email) values (?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, address);
            preparedStatement.setString(3, email);
            
        int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                System.out.println("SUCCESS added to customer table");
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        try {
            connection = ConnectionManager.createConnection();
            String query = "insert into users(fullName,email,userName,password,userRole) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, "Customer");

            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                ResultSet rs= null;
                setCustomerID(connection,preparedStatement,rs,registerBean,email);
                return "SUCCESS";
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    private void setCustomerID(Connection connection,PreparedStatement preparedStatement, ResultSet resultSet,RegisterBean registerBean,String email)
    {
        try{
            connection = ConnectionManager.createConnection();
            String query = "SELECT * FROM Customer WHERE email = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                registerBean.setCustomerID(resultSet.getInt("id"));
            }
            
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
