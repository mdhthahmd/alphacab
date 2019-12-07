package com.alphacab.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alphacab.model.LoginBean;
import com.alphacab.dao.LoginDao;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean();

        loginBean.setEmail(email);
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao();

        try {
            String userValidate = loginDao.authenticateUser(loginBean);

            if (userValidate.equals("Admin_Role")) {
                System.out.println("Admin's Home");

                HttpSession session = request.getSession(); //Creating a session
                session.setMaxInactiveInterval(10 * 60);
                session.setAttribute("Role", "Admin");
                session.setAttribute("Email", email);
                session.setAttribute("userName", loginBean.getUserName());
                
                
                response.sendRedirect(request.getContextPath()+"/assign-jobs");
                

            } else if (userValidate.equals("Driver_Role")) {

                System.out.println("Driver's Home");

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10 * 60);
                session.setAttribute("Role", "Driver");
                session.setAttribute("Email", email);
                session.setAttribute("userName", loginBean.getUserName());

                response.sendRedirect("dashboard");

            } else if (userValidate.equals("Customer_Role")) {

                System.out.println("Customer's Home");

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10 * 60);
                session.setAttribute("Role", "Customer");
                session.setAttribute("userName", loginBean.getUserName());
                session.setAttribute("Email", email);
                session.setAttribute("CustomerID",loginBean.getCustomerID());
                
                response.sendRedirect(request.getContextPath()+"/get-a-ride");

            } else {
                System.out.println("Error message = " + userValidate);
                
                request.setAttribute("errMessage", userValidate);
                response.sendRedirect(request.getContextPath()+"/");
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
