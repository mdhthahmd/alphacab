package com.alphacab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alphacab.model.LoginBean;
import com.alphacab.dao.LoginDao;

/**
 *
 * @author SimSadrowpsX
 */
public class LoginServlet extends HttpServlet {

   

  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get the creds
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // init LoginBean
        LoginBean loginBean = new LoginBean(); 

        loginBean.setEmail(email); 
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao();

        // validate
        String userValidate = loginDao.authenticateUser(loginBean); 

        if (userValidate.equals("SUCCESS"))
        {
            request.setAttribute("email", email); 
            request.getRequestDispatcher("/Home.jsp").forward(request, response);
        } else {
            request.setAttribute("errMessage", userValidate); 
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }

  

}
