/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.dao;

import com.alphacab.database.ConnectionManager;
import com.alphacab.model.JourneyPriceRateBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author samooh
 */
public class JourneyPriceRateDao {
    
    public String updateJourneyPriceRates(JourneyPriceRateBean priceRateBean)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {

            String query = "UPDATE journeyPriceRate SET JourneyPriceRate=?";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setDouble(1,priceRateBean.getPriceRate());
            
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
    
    public String getJourneyPriceRates(JourneyPriceRateBean priceRateBean)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {

            String query = "SELECT * FROM journeyPriceRate";

            connection = ConnectionManager.createConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next())
            {
               priceRateBean.setPriceRate(resultSet.getDouble(1));
            }
            connection.close();
            
            return "OK";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.

    }
}
