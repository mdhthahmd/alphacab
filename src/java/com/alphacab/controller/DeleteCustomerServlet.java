/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alphacab.controller;

import com.alphacab.dao.CustomersDao;
import com.alphacab.model.UserBean;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author de
 */
public class DeleteCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Path", "delete-driver");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            session.setAttribute("Path", "delete-driver");
        
            String customerEmail = getDataFromJspTable(request,"submitCEmail");
            
            UserBean customer = new UserBean();
            customer.setEmail(customerEmail);
            
            CustomersDao deleteCustomer = new CustomersDao();
            String confirm = deleteCustomer.deleteCustomer(customer);
            if(confirm.equals("OK"))
            {
                System.out.println("Driver Deleted");
                response.sendRedirect(request.getContextPath()+"/customers-list");
            }else {
                response.sendRedirect(request.getContextPath()+"/customers-list");
                System.out.println("Failed unable to delete customer");
            }
            
            
    }
    
    private String getDataFromJspTable(HttpServletRequest request, String SUBMIT_PREFIX) {
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
