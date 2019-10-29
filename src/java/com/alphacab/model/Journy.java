/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author ADMIN
 */
public class Journy {
    Date s_date;
    Time s_time;
    String pickup;
    String drop;
    String userID;
    String driverID;

    public Journy(Date s_date, Time s_time, String pickup, String drop, String userID, String driverID) {
        this.s_date = s_date;
        this.s_time = s_time;
        this.pickup = pickup;
        this.drop = drop;
        this.userID = userID;
        this.driverID = driverID;
    }
    
    public Date getS_date() {
        return s_date;
    }

    public Time getS_time() {
        return s_time;
    }

    public String getPickup() {
        return pickup;
    }

    public String getDrop() {
        return drop;
    }

    public String getUserID() {
        return userID;
    }

    public String getDriverID() {
        return driverID;
    }
}
