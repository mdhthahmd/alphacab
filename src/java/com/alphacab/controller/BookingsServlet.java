package com.alphacab.controller;

import com.alphacab.dao.JourneyDao;
import com.alphacab.model.JourneyBean;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            session.setAttribute("Path", "bookings");
            
            JourneyDao jd = new JourneyDao();
            ArrayList<JourneyBean> journeys = new ArrayList<>();
            
            System.out.println(session.getAttribute("Email") + "##########################################################################################");
            String Status = jd.getAllJourneysForCustomer( (String) session.getAttribute("Email"), journeys);
            
            System.out.println("================================================================================================" + Status);
            
            request.setAttribute("Bookings", journeys );
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
