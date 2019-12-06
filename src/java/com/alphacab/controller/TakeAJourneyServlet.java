package com.alphacab.controller;

import com.alphacab.dao.JourneyDao;
import com.alphacab.model.JourneyBean;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TakeAJourneyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Path", "take-a-journey");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            session.setAttribute("Path", "take-a-journey");
        
            JourneyDao jd = new JourneyDao();
            ArrayList<JourneyBean> journeys = new ArrayList<>();
        
            String journeyID = getJourneyIDFromTable(request,"submit_");
            String Status = jd.getJourneyDetailsForDriver(Integer.parseInt(journeyID), journeys);
            
            if(Status.equals("OK"))
                {
                    session.setAttribute("take-a-journey", journeys);
                    response.sendRedirect(request.getContextPath()+"/take-a-journey");
            }else {
                System.out.println("some problems on journey DAO triggered from TakeAJouurneyServlet");
                request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
            }
    }
    //give the same name to the prifix as the button  , and on the  jsp page assigin the data to button after 
    //the prifix( button name + value you wanna send over) :D
    //eg: name=<%="submit_"+journeys.get(i).getJourneyID()%>
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
