package com.alphacab.controller;

import com.alphacab.dao.DriverDao;
import com.alphacab.model.UserBean;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DriversListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // response
        // request.setAttribute("variable name","value of its");
        
        ArrayList<UserBean> drivers = new ArrayList<>();
        
        DriverDao driverDao = new DriverDao();
        String result = driverDao.driversList(drivers);
        
        HttpSession session = request.getSession();
        session.setAttribute("drivers",drivers);
        
        session.setAttribute("Path", "drivers");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);

   
    }
}