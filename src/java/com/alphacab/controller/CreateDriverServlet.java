package com.alphacab.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alphacab.model.CreateDriverBean;
import com.alphacab.dao.DriverDao;
import javax.servlet.http.HttpSession;

public class CreateDriverServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        
        
        CreateDriverBean createDriverBean = new CreateDriverBean();
        createDriverBean.setFullName(fullName);
        createDriverBean.setEmail(email);
        createDriverBean.setUserName(userName);
        createDriverBean.setPassword(password);

        DriverDao driverDao = new DriverDao();
        //////////////////////////////////////////////////////////////////////////

        //The core Logic of the Creating driver is present here. We are going to insert user data in to the database.
        String driverCreated = driverDao.createDriver(createDriverBean);

        if (driverCreated.equals("SUCCESS")) //On success, you can display a message to user on Home page
        {    
            request.setAttribute("userName", createDriverBean.getUserName() );
            session.setAttribute("Customer", createDriverBean.getEmail() );
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
        } else //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", driverCreated);
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
        }
    }
}
