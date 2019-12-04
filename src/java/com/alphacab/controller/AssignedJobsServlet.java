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

public class AssignedJobsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            session.setAttribute("Path", "assigned-jobs");
            
            JourneyDao jd = new JourneyDao();
            ArrayList<JourneyBean> journeys = new ArrayList<>();
            
            String Status = jd.getJourneyDetails( (String) session.getAttribute("Email"), journeys);
            
            if(Status.equals("OK"))
            {
                request.setAttribute("assigned-jobs", journeys );
            }else {
                System.out.println("some problems on journey DAO");
            }
            
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
