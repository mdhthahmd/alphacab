package com.alphacab.controller;

import com.alphacab.dao.CustomersDao;
import com.alphacab.model.UserBean;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomersListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // response
        // request.setAttribute("variable name","value of its");
        
        ArrayList<UserBean> customers = new ArrayList<>();
        
        CustomersDao customerDao = new CustomersDao();
        String result = customerDao.customersList(customers);
        
        HttpSession session = request.getSession();
        session.setAttribute("customers",customers);
        
        session.setAttribute("Path", "customers-list");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);

   
    }
}