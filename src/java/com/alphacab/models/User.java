/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.models;

/**
 *
 * @author ADMIN
 */
public class User {
     String username;
     String pass;
     String email;
     
    //Constructor declaration of class
     public User(String username,String pass,String email){
         this.username = username;
         this.pass = pass;
         this.email = email;
     }
    
     // method 1
     public String getUsername(){
         return username;
     }
     // method 2
     public String getPass(){
        return pass;
     }
      // method 3
     public String getEmail(){
        return email;
     }
}
