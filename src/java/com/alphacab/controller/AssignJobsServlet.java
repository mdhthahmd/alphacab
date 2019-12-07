/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.controller;

import com.alphacab.dao.DriverDao;
import com.alphacab.dao.JourneyDao;
import com.alphacab.model.DriverBean;
import com.alphacab.model.JourneyBean;
import com.alphacab.model.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author samooh
 */
public class AssignJobsServlet extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            
            //for unassigned jobs list
            JourneyDao jd = new JourneyDao();
            ArrayList<JourneyBean> journeys = new ArrayList<>();
            String Status = jd.getJourneysFromStatus("UNASSIGNED", journeys);
            
            //drivers list
            ArrayList<UserBean> drivers = new ArrayList<>();
        
            DriverDao driverDao = new DriverDao();
            String result = driverDao.driversList(drivers);
            
            if(Status.equals("OK") && result.equals("OK"))
            {
                
                session.setAttribute("driverList", drivers);
                session.setAttribute("unassignedJobs", journeys);
                session.setAttribute("Path", "assign-jobs");
                request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
            }
            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            
            DriverBean driverDetails = new DriverBean();
            DriverDao driverDao = new DriverDao();
            JourneyDao journeyDao = new JourneyDao();
            
            String email = request.getParameter("driverEmail");
            String jid = getJourneyIDFromTable(request, "submit_");
            
           String confermation = driverDao.specficDriverDetails(email, driverDetails);
           
           if(confermation.equals("OK"))
           {
               String ok = journeyDao.assiginJourneys(driverDetails, Integer.parseInt(jid));
               
               if(ok.equals("OK"))
               {
                   System.out.println("journey Assigined");
                   response.sendRedirect(request.getContextPath()+"/assign-jobs");
               }
           }
            
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
