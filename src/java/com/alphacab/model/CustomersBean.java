package com.alphacab.model;

public class CustomersBean {

    private String fullName;
    private String email;
    private String userName;
    private String password;
    private int id;
    private String role;
    private String address;
    
    public void setAddress(String address) {
        this.address = address;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getAddress() {
        return address;
    }

    public int getId() {
        return id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
