package com.alphacab.model;

public class RegisterBean {

    private String fullName;
    private String email;
    private String userName;
    private String password;
    private String address;
    private int customerID;
    
    public int getCustomerID()
    {
        return customerID;
    }
    
    public void setCustomerID(int id)
    {
        this.customerID = id;
    }
    
    public void setAddress(String address)
    {
        this.address = address;
    }
   
    public String getAddress()
    {
        return address;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
}
