/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.models;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Driver {

    String name;
    String p_address;
    String email;
    int mobile_No;
    Date t_date;
    String d_licence;
    
    public Driver(String name, String P_address, String email, int mobile_No, Date T_date) {
        this.name = name;
        this.P_address = P_address;
        this.email = email;
        this.mobile_No = mobile_No;
        this.T_date = T_date;
    }
    
    public String getName() {
        return name;
    }

    public String getP_address() {
        return P_address;
    }

    public String getEmail() {
        return email;
    }

    public int getMobile_No() {
        return mobile_No;
    }

    public Date getT_date() {
        return T_date;
    }

    public String getD_licence() {
        return D_licence;
    }
}
