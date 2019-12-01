package com.alphacab.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        String distance = request.getParameter("distance");
        String origin_lat = request.getParameter("origin-lat");
        String origin_lng = request.getParameter("origin-lng");
        String destination_lat = request.getParameter("destination-lat");
        String destination_lng = request.getParameter("destination-lng");
        String originAddress = request.getParameter("originAddress");
        String destinationAddress = request.getParameter("destinationAddress");
        
        
        System.out.println(distance);
        System.out.println(origin_lat);
        System.out.println(origin_lng);
        System.out.println(destination_lat);
        System.out.println(destination_lng);
        System.out.println(originAddress);
        System.out.println(destinationAddress);
    }

}
