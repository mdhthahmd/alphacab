/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.controller;

import com.alphacab.dao.JourneyDao;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author de
 */
public class CancelBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Path", "cancel-booking");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = getJourneyIDFromTable(request, "submit_");
        JourneyDao jdao =new JourneyDao();
        jdao.cancelJourneys(Integer.parseInt(id));
        
        response.sendRedirect(request.getContextPath()+"/bookings");
    }
    
    private String getJourneyIDFromTable(HttpServletRequest request, String SUBMIT_PREFIX) {
        String value;
        for (Enumeration e = request.getParameterNames(); e.hasMoreElements();) {
            String key = (String) e.nextElement();
            
            if (key.startsWith(SUBMIT_PREFIX)) {
                value = key.substring(SUBMIT_PREFIX.length());
                value = value.replaceAll("/$", "");
                return value;
            }
        }
        return null;
    }
}
