package com.alphacab.model;

import java.sql.Date;
import java.sql.Time;


public class JourneyBean {

    private int journeyID;
    private String email;
    private Date date;
    private Time time;
    private String pickupLocation;
    private double p_Lattitude;
    private double p_Longitude;
    private String dropoffLocation;
    private double d_Lattitude;
    private double d_Longitude;
    private String status;
    private double distance;
    private String assigneddriver;
    private String registration;
    private int customerID;
    private double journeyPrice;
    private String userName;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setAssigneddriver(String assigneddriver) {
        this.assigneddriver = assigneddriver;
    }

    public void setRegistration(String registration) {
        this.registration = registration;
    }

    public void setCustomerID(int id) {
        this.customerID = id;
    }

    public void setJourneyPrice(double journeyPrice) {
        this.journeyPrice = journeyPrice;
    }

    public String getAssigneddriver() {
        return assigneddriver;
    }

    public String getRegistration() {
        return registration;
    }

    public int getCustomerID() {
        return customerID;
    }

    public double getJourneyPrice() {
        return journeyPrice;
    }
    
    public void setAssiginedDriver(String assigneddriver)    
    {
        this.assigneddriver = assigneddriver;
    }
    
    public String getAssiginedDriver()
    {
        return assigneddriver;
    }

    public double getDistance() {
        return distance;
    }
    public void setDistance(double distance) {
        this.distance = distance;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public int getJourneyID() {
        return journeyID;
    }

    public void setJourneyID(int journeyID) {
        this.journeyID = journeyID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public double getP_Lattitude() {
        return p_Lattitude;
    }

    public void setP_Lattitude(double p_Lattitude) {
        this.p_Lattitude = p_Lattitude;
    }

    public double getP_Longitude() {
        return p_Longitude;
    }

    public void setP_Longitude(double p_Longitude) {
        this.p_Longitude = p_Longitude;
    }

    public String getDropoffLocation() {
        return dropoffLocation;
    }

    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }

    public double getD_Lattitude() {
        return d_Lattitude;
    }

    public void setD_Lattitude(double d_Lattitude) {
        this.d_Lattitude = d_Lattitude;
    }

    public double getD_Longitude() {
        return d_Longitude;
    }

    public void setD_Longitude(double d_Longitude) {
        this.d_Longitude = d_Longitude;
    }

    public JourneyBean() {
    }
    
    

}
