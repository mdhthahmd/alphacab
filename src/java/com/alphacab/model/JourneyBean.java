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
    private int p_Lattitude;
    private int p_Longitude;
    private String dropoffLocation;
    private int d_Lattitude;
    private int d_Longitude;
    private String status;

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

    public int getP_Lattitude() {
        return p_Lattitude;
    }

    public void setP_Lattitude(int p_Lattitude) {
        this.p_Lattitude = p_Lattitude;
    }

    public int getP_Longitude() {
        return p_Longitude;
    }

    public void setP_Longitude(int p_Longitude) {
        this.p_Longitude = p_Longitude;
    }

    public String getDropoffLocation() {
        return dropoffLocation;
    }

    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }

    public int getD_Lattitude() {
        return d_Lattitude;
    }

    public void setD_Lattitude(int d_Lattitude) {
        this.d_Lattitude = d_Lattitude;
    }

    public int getD_Longitude() {
        return d_Longitude;
    }

    public void setD_Longitude(int d_Longitude) {
        this.d_Longitude = d_Longitude;
    }

    public JourneyBean() {
    }
    
    

}
