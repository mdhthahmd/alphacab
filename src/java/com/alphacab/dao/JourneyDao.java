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
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

public class JourneyDao {

    public String AddJourney(JourneyBean journeyBean) {
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
        int customerID = journeyBean.getCustomerID();
        double journeyPrice = journeyBean.getJourneyPrice();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionManager.createConnection();
            String query = "INSERT INTO journeys(email,pickup_location,p_lattitude,p_longitude,dropoff_location,d_lattitude,d_longitude,journeyDistance,status,id,JOURNEY_PRICE) \n" +
            "values(?,?,?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
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
            preparedStatement.setInt(10, customerID);
            preparedStatement.setDouble(11, journeyPrice);
            

            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                copyDataToDemandsTabble(connection,preparedStatement,journeyBean);
                return "SUCCESS";
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }


    public String getJourneyDetails(String emailAdress, ArrayList<JourneyBean> journeys) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT * FROM JOURNEYS WHERE email = ? or ASSIGNEDDRIVER = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, emailAdress);
            preparedStatement.setString(2, emailAdress);
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                
                JourneyBean journey = new JourneyBean();
                
                int journeyID = resultSet.getInt(1);
                Date date = resultSet.getDate("date_time");
                String pickupLocation =  resultSet.getString("pickup_location");
                double p_Lattitude = resultSet.getDouble("p_lattitude");
                double p_Longitude = resultSet.getDouble("p_longitude");
                String dropoffLocation = resultSet.getString("dropoff_location");
                double d_Lattitude = resultSet.getDouble("d_lattitude");
                double d_Longitude =  resultSet.getDouble("d_longitude");
                String status = resultSet.getString("status");
                double distance = resultSet.getDouble("journeyDistance");
                String customerEmail = resultSet.getString("email");
                //get time from time stamp
                String strTime = (""+resultSet.getTimestamp("date_time"));
                String []objTime = strTime.split(" ");
                String []temp = objTime[1].split("\\.");
                Time time = java.sql.Time.valueOf(temp[0]);
                
                journey.setEmail(customerEmail);
                journey.setJourneyID(journeyID);
                journey.setTime(time);
                journey.setDate(date);
                journey.setPickupLocation(pickupLocation);
                journey.setP_Lattitude(p_Lattitude);
                journey.setP_Longitude(p_Longitude);
                journey.setDropoffLocation(dropoffLocation);
                journey.setD_Lattitude(d_Lattitude);
                journey.setD_Longitude(d_Longitude);
                journey.setStatus(status);
                journey.setDistance(distance);
                
                journeys.add(journey);
            }
            
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.

    }

    public String getJourneyDetailsForDriver(int jID, ArrayList journeys) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT * FROM JOURNEYS WHERE journeyID = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, jID);
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                
                JourneyBean journey = new JourneyBean();
                
                int journeyID = resultSet.getInt(1);
                Date date = resultSet.getDate("date_time");
                String pickupLocation =  resultSet.getString("pickup_location");
                double p_Lattitude = resultSet.getDouble("p_lattitude");
                double p_Longitude = resultSet.getDouble("p_longitude");
                String dropoffLocation = resultSet.getString("dropoff_location");
                double d_Lattitude = resultSet.getDouble("d_lattitude");
                double d_Longitude =  resultSet.getDouble("d_longitude");
                String status = resultSet.getString("status");
                double distance = resultSet.getDouble("journeyDistance");
                String customerEmail = resultSet.getString("email");
                //get time from time stamp
                String strTime = (""+resultSet.getTimestamp("date_time"));
                String []objTime = strTime.split(" ");
                String []temp = objTime[1].split("\\.");
                Time time = java.sql.Time.valueOf(temp[0]);
                
                journey.setEmail(customerEmail);
                journey.setJourneyID(journeyID);
                journey.setTime(time);
                journey.setDate(date);
                journey.setPickupLocation(pickupLocation);
                journey.setP_Lattitude(p_Lattitude);
                journey.setP_Longitude(p_Longitude);
                journey.setDropoffLocation(dropoffLocation);
                journey.setD_Lattitude(d_Lattitude);
                journey.setD_Longitude(d_Longitude);
                journey.setStatus(status);
                journey.setDistance(distance);
                
                journeys.add(journey);
            }
            
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.

    }

    private void copyDataToDemandsTabble(Connection connection, PreparedStatement preparedStatement, JourneyBean journeyBean) {
        String pickupLocation = journeyBean.getPickupLocation();
        String dropoffLocation = journeyBean.getDropoffLocation();
        String status = journeyBean.getStatus();
        String userName = journeyBean.getUserName();
        
        try {
            connection = ConnectionManager.createConnection();
            String query = "INSERT INTO Demands(Name,Address,Destination,Status) \n" +
            "values(?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, pickupLocation);
            preparedStatement.setString(3, dropoffLocation);
            preparedStatement.setString(4, status);
            
            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                System.out.println("SUCCESS added to demands  table");
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String getHistoryForCustomer( String emailAdress, ArrayList<JourneyBean> journeys ) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT * FROM JOURNEYS WHERE STATUS <> 'UNASSIGNED' AND EMAIL = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, emailAdress);
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                
                JourneyBean journey = new JourneyBean();
                
                int journeyID = resultSet.getInt(1);
                Date date = resultSet.getDate("date_time");
                String pickupLocation =  resultSet.getString("pickup_location");
                double p_Lattitude = resultSet.getDouble("p_lattitude");
                double p_Longitude = resultSet.getDouble("p_longitude");
                String dropoffLocation = resultSet.getString("dropoff_location");
                double d_Lattitude = resultSet.getDouble("d_lattitude");
                double d_Longitude =  resultSet.getDouble("d_longitude");
                String status = resultSet.getString("status");
                double distance = resultSet.getDouble("journeyDistance");
                String customerEmail = resultSet.getString("email");
                //get time from time stamp
                String strTime = (""+resultSet.getTimestamp("date_time"));
                String []objTime = strTime.split(" ");
                String []temp = objTime[1].split("\\.");
                Time time = java.sql.Time.valueOf(temp[0]);
                
                journey.setEmail(customerEmail);
                journey.setJourneyID(journeyID);
                journey.setTime(time);
                journey.setDate(date);
                journey.setPickupLocation(pickupLocation);
                journey.setP_Lattitude(p_Lattitude);
                journey.setP_Longitude(p_Longitude);
                journey.setDropoffLocation(dropoffLocation);
                journey.setD_Lattitude(d_Lattitude);
                journey.setD_Longitude(d_Longitude);
                journey.setStatus(status);
                journey.setDistance(distance);
                
                journeys.add(journey);
            }
            
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String getBookingsForCustomer( String emailAdress, ArrayList<JourneyBean> journeys ) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            String query = "SELECT * FROM JOURNEYS WHERE STATUS = 'UNASSIGNED' AND EMAIL = ?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, emailAdress);
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                
                JourneyBean journey = new JourneyBean();
                
                int journeyID = resultSet.getInt(1);
                Date date = resultSet.getDate("date_time");
                String pickupLocation =  resultSet.getString("pickup_location");
                double p_Lattitude = resultSet.getDouble("p_lattitude");
                double p_Longitude = resultSet.getDouble("p_longitude");
                String dropoffLocation = resultSet.getString("dropoff_location");
                double d_Lattitude = resultSet.getDouble("d_lattitude");
                double d_Longitude =  resultSet.getDouble("d_longitude");
                String status = resultSet.getString("status");
                double distance = resultSet.getDouble("journeyDistance");
                String customerEmail = resultSet.getString("email");
                //get time from time stamp
                String strTime = (""+resultSet.getTimestamp("date_time"));
                String []objTime = strTime.split(" ");
                String []temp = objTime[1].split("\\.");
                Time time = java.sql.Time.valueOf(temp[0]);
                
                journey.setEmail(customerEmail);
                journey.setJourneyID(journeyID);
                journey.setTime(time);
                journey.setDate(date);
                journey.setPickupLocation(pickupLocation);
                journey.setP_Lattitude(p_Lattitude);
                journey.setP_Longitude(p_Longitude);
                journey.setDropoffLocation(dropoffLocation);
                journey.setD_Lattitude(d_Lattitude);
                journey.setD_Longitude(d_Longitude);
                journey.setStatus(status);
                journey.setDistance(distance);
                
                journeys.add(journey);
            }
            
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
   
}