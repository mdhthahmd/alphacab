/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  SimSadrowpsX
 * Created: Oct 27, 2019
 */


CREATE TABLE users (
    fullName VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    userName VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    PRIMARY KEY (email)
);
