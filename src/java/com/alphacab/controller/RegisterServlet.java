package com.alphacab.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alphacab.model.RegisterBean;
import com.alphacab.dao.RegisterDao;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

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
        
        
        RegisterBean registerBean = new RegisterBean();
        registerBean.setFullName(fullName);
        registerBean.setEmail(email);
        registerBean.setUserName(userName);
        registerBean.setPassword(password);

        RegisterDao registerDao = new RegisterDao();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRegistered = registerDao.registerUser(registerBean);

        if (userRegistered.equals("SUCCESS")) //On success, you can display a message to user on Home page
        {    
            request.setAttribute("userName", registerBean.getUserName() );
            session.setAttribute("Customer", registerBean.getEmail() );
            System.out.println("Asslah hasdhjdascjkasjckjsk");
            request.getRequestDispatcher("views/customer/customer-dashboard.jsp").forward(request, response);
            
     
            System.out.println("Nabbu Nabeel");
        } else //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}