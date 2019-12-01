/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.alphacab.model.JourneyBean;
import com.alphacab.database.ConnectionManager;
import java.sql.Date;
import java.sql.Time;

public class JourneyDao {

    public String Journey(JourneyBean journeyBean) {
        int journeyID = journeyBean.getJourneyID();
        String email = journeyBean.getEmail();
        Date date = journeyBean.getDate();
        Time time = journeyBean.getTime();
        String pickupLocation = journeyBean.getPickupLocation();
        int p_Lattitude = journeyBean.getD_Lattitude();
        int p_Longitude = journeyBean.getD_Longitude();
        String dropoffLocation = journeyBean.getDropoffLocation();
        int d_Lattitude = journeyBean.getD_Lattitude();
        int d_Longitude = journeyBean.getD_Longitude();
        String status = journeyBean.getStatus();


        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionManager.createConnection();
            String query = "INSERT INTO journeys(email,pickup_location,p_lattitude,p_longitude,dropoff_location,d_lattitude,d_longitude,status) \n" +
            "values(?,?,?,?,?,?,?,?);"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setInt(1, journeyID);
            preparedStatement.setString(2, email);
            preparedStatement.setDate(3, date);
            preparedStatement.setTime(4, time);
            preparedStatement.setString(5, pickupLocation);
            preparedStatement.setInt(6, p_Lattitude);
            preparedStatement.setInt(7, p_Longitude);
            preparedStatement.setString(8, dropoffLocation);
            preparedStatement.setInt(9, d_Lattitude);
            preparedStatement.setInt(10, d_Lattitude);
            preparedStatement.setString(10, status);
            

            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                return "SUCCESS";
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
}
