package com.alphacab.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alphacab.model.JourneyBean;
import com.alphacab.dao.JourneyDao;

public class GetARideServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Path", "get-a-ride");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String distance = request.getParameter("distance");
        String origin_lat = request.getParameter("origin-lat");
        String origin_lng = request.getParameter("origin-lng");
        String destination_lat = request.getParameter("destination-lat");
        String destination_lng = request.getParameter("destination-lng");
        String originAddress = request.getParameter("originAddress");
        String destinationAddress = request.getParameter("destinationAddress");
        String journeyPrice = request.getParameter("journeyPrice");
        
        JourneyBean jb = new JourneyBean();
        jb.setEmail(""+session.getAttribute("Email"));
        // jb.setId(Integer.parseInt(""+session.getAttribute("ID"))); 
        jb.setStatus("UNASSIGNED");
        jb.setDistance(Double.parseDouble(distance));
        jb.setP_Lattitude(Double.parseDouble(origin_lat));
        jb.setP_Longitude(Double.parseDouble(origin_lng));
        jb.setD_Lattitude(Double.parseDouble(destination_lat));
        jb.setD_Longitude(Double.parseDouble(destination_lng));
        jb.setPickupLocation(originAddress);
        jb.setDropoffLocation(destinationAddress);
        //        jb.setJourneyPrice(Double.parseDouble(journeyPrice));
        
        JourneyDao journeyDao = new JourneyDao();

        String addJourney = journeyDao.AddJourney(jb);
        
        System.out.println(addJourney);
        if (addJourney.equals("SUCCESS"))
        {
            
            
           response.sendRedirect(request.getContextPath()+"/bookings");
            
        } else {
            session.setAttribute("Path", "get-a-ride");
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
        }
    }
}
