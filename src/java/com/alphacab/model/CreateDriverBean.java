package com.alphacab.model;

public class CreateDriverBean {

    private String fullName;
    private String email;
    private String userName;
    private String password;
    private String registration;

    public void setRegistration(String registration) {
        this.registration = registration;
    }

    public String getRegistration() {
        return registration;
    }
    private String role;

    public void setRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
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
