/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.alphacab.database.ConnectionManager;
import com.alphacab.model.UserBean;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomersDao {
    public String customersList(ArrayList<UserBean> customers) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT FULLNAME, USERNAME, EMAIL FROM USERS WHERE USERROLE = 'Customer'";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            //==============================================================
//            ResultSetMetaData rsmd = resultSet.getMetaData();
//            int columnsNumber = rsmd.getColumnCount();
//            while (resultSet.next()) {
//                for (int i = 1; i <= columnsNumber; i++) {
//                    if (i > 1) {
//                        System.out.print(",  ");
//                    }
//                    String columnValue = resultSet.getString(i);
//                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
//                }
//                System.out.println("");
//            }
            //==============================================================
            while (resultSet.next()) {

                String fullName = resultSet.getString("FULLNAME");
                String userName = resultSet.getString("USERNAME");
                String email = resultSet.getString("EMAIL");

                UserBean driver = new UserBean();
                driver.setFirstName(fullName);
                driver.setLastName(userName);
                driver.setEmail(email);
               
                customers.add(driver);
            }

            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String deleteCustomer(UserBean customer) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "DELETE FROM USERS WHERE EMAIL = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,customer.getEmail() );
            
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

            //==============================================================
//            ResultSetMetaData rsmd = resultSet.getMetaData();
//            int columnsNumber = rsmd.getColumnCount();
//            while (resultSet.next()) {
//                for (int i = 1; i <= columnsNumber; i++) {
//                    if (i > 1) {
//                        System.out.print(",  ");
//                    }
//                    String columnValue = resultSet.getString(i);
//                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
//                }
//                System.out.println("");
//            }
            //==============================================================
            

            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String updateCustomer(UserBean customer) {
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "UPDATE USERS SET FULLNAME=?,USERNAME=? WHERE EMAIL=?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1,customer.getFirstName());
            preparedStatement.setString(2,customer.getLastName());
            preparedStatement.setString(3,customer.getEmail());
            
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

            //==============================================================
//            ResultSetMetaData rsmd = resultSet.getMetaData();
//            int columnsNumber = rsmd.getColumnCount();
//            while (resultSet.next()) {
//                for (int i = 1; i <= columnsNumber; i++) {
//                    if (i > 1) {
//                        System.out.print(",  ");
//                    }
//                    String columnValue = resultSet.getString(i);
//                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
//                }
//                System.out.println("");
//            }
            //==============================================================
            
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
}
