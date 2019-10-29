
package com.alphacab.model;

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
        this.p_address = P_address;
        this.email = email;
        this.mobile_No = mobile_No;
        this.t_date = T_date;
    }
    
    public String getName() {
        return name;
    }

    public String getP_address() {
        return p_address;
    }

    public String getEmail() {
        return email;
    }

    public int getMobile_No() {
        return mobile_No;
    }

    public Date getT_date() {
        return t_date;
    }

    public String getD_licence() {
        return d_licence;
    }
}
