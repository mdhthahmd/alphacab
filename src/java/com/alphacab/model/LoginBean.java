//LoginBean.java
 
package com.alphacab.model;
 
public class LoginBean {
 
 private String email;
 private String password;
 private String userName;
 
 public String getUserName() {
     return this.userName;
 }
 
 public void setUserName(String username ){
     this.userName = username;
 }
 
 public String getEmail() {
 return email;
 }
 public void setEmail(String email) {
 this.email = email;
 }
 public String getPassword() {
 return password;
 }
 public void setPassword(String password) {
 this.password = password;
 }
}