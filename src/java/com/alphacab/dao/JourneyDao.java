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
        //int journeyID = journeyBean.getJourneyID();
        //Date date = journeyBean.getDate();
        //Time time = journeyBean.getTime();
        String email = journeyBean.getEmail();
        String pickupLocation = journeyBean.getPickupLocation();
        double p_Lattitude = journeyBean.getP_Lattitude();
        double p_Longitude = journeyBean.getP_Longitude();
        String dropoffLocation = journeyBean.getDropoffLocation();
        double d_Lattitude = journeyBean.getD_Lattitude();
        double d_Longitude = journeyBean.getD_Longitude();
        double journeyDistance = journeyBean.getDistance();
        String status = journeyBean.getStatus();

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionManager.createConnection();
            String query = "INSERT INTO journeys(email,pickup_location,p_lattitude,p_longitude,dropoff_location,d_lattitude,d_longitude,journeyDistance,status) \n" +
            "values(?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, pickupLocation);
            preparedStatement.setDouble(3, p_Lattitude);
            preparedStatement.setDouble(4, p_Longitude);
            preparedStatement.setString(5, dropoffLocation);
            preparedStatement.setDouble(6, d_Lattitude);
            preparedStatement.setDouble(7, d_Longitude);
            preparedStatement.setDouble(8, journeyDistance);
            preparedStatement.setString(9, status);
            //preparedStatement.setDate(2, date);
            //preparedStatement.setTime(3, time);
            

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
