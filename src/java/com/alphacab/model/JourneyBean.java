package com.alphacab.model;


import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;


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
