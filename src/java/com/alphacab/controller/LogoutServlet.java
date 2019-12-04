package com.alphacab.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null)
        {
            session.invalidate();
            // request.setAttribute("errMessage", "You have logged out successfully");
            response.sendRedirect(request.getContextPath()+"/");
            System.out.println("Logged out");
        }
    }
}
