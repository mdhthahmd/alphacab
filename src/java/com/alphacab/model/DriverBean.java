package com.alphacab.model;

public class DriverBean {

    String name;
    String email;
    String d_licence;
    
    
    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setLicence(String d_licence) {
        this.d_licence = d_licence;
    }
    
    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getLicence() {
        return d_licence;
    }
}
