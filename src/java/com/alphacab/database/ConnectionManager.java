package com.alphacab.database;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.derby.jdbc.ClientDataSource;
import java.sql.Connection;

public class ConnectionManager {

    public static Connection createConnection() {
        
        Connection connection = null;

        /* try (InputStream input = new FileInputStream("./config/db.properties")) {

            Properties dbConfig = new Properties();

            // load a properties file
            dbConfig.load(input);

            String host, port, db, user, password;

            host = dbConfig.getProperty("host");
            port = dbConfig.getProperty("port");
            db = dbConfig.getProperty("db");
            user = dbConfig.getProperty("user");
            password = dbConfig.getProperty("password");

            // jdbc:derby:[subsubprotocol:][databaseName][;attribute=value]*
            // https://db.apache.org/derby/docs/10.7/adminguide/radminnsdatasourcexmp.html
            String connectionURL = String.format("jdbc:derby://%s:%s/%s", host, port, db);

            System.out.println(connectionURL); */

            ClientDataSource ds = new ClientDataSource();
            ds.setServerName("localhost");
            ds.setPortNumber(1527);
            ds.setDatabaseName("cabdb");
            ds.setUser("root");
            ds.setPassword("root");

            try {
                connection = ds.getConnection();
            } catch (Exception e) {
                System.out.println("Error: Creating thr DBConnection!");
            }
        /*} catch (IOException ex) {
            System.out.println("Error: One or more db configs not loaded");
            ex.printStackTrace();
        }*/
        return connection;
    }
}
