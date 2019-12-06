/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.alphacab.model.CreateDriverBean;
import com.alphacab.database.ConnectionManager;
import com.alphacab.model.UserBean;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

public class DriverDao {

    public String createDriver(CreateDriverBean createDriverBean) {
        String fullName = createDriverBean.getFullName();
        String email = createDriverBean.getEmail();
        String userName = createDriverBean.getUserName();
        String password = createDriverBean.getPassword();

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionManager.createConnection();
            String query = "insert into users(fullName,email,userName,password,userRole) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, "Driver");

            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                addToDriverTable(createDriverBean);
                return "SUCCESS";
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }

    public String driversList(ArrayList<UserBean> drivers) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT FULLNAME, USERNAME, EMAIL FROM USERS WHERE USERROLE = 'Driver'";

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
               
                drivers.add(driver);
            }

            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String deleteDriver(UserBean driver) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "DELETE FROM USERS WHERE EMAIL = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,driver.getEmail() );
            
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
            deleteFromDriverTable(driver);
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String updateDriver(UserBean driver) {
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "UPDATE USERS SET FULLNAME=?,USERNAME=? WHERE EMAIL=?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1,driver.getFirstName());
            preparedStatement.setString(2,driver.getLastName());
            preparedStatement.setString(3,driver.getEmail());
            
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
    
    private void addToDriverTable(CreateDriverBean createDriverBean)
    {
        String fullName = createDriverBean.getFullName();
        String email = createDriverBean.getEmail();
        String pateNo = createDriverBean.getRegistration();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionManager.createConnection();
            String query = "insert into Drivers(email,Registration,Name) values (?,?,?)";
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,pateNo);
            preparedStatement.setString(3, fullName);
            
            
            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                System.out.println("Added to driver table");
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void deleteFromDriverTable(UserBean driver)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            String query = "DELETE FROM Drivers WHERE EMAIL = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,driver.getEmail());
            
            int row = preparedStatement.executeUpdate();
            System.out.println(row);
            
             connection.close();
            
            System.out.println("Driver Removed form driver table");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
