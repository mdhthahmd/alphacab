package com.alphacab.controller;

import com.alphacab.dao.JourneyPriceRateDao;
import com.alphacab.model.JourneyPriceRateBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePriceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            JourneyPriceRateDao pRate = new JourneyPriceRateDao();
            JourneyPriceRateBean pRateBean = new JourneyPriceRateBean();
            String stat = pRate.getJourneyPriceRates(pRateBean);
            
            session.setAttribute("Path", "change-price");
            
            if(stat.equals("OK"))
            {
                request.setAttribute("priceRate", pRateBean ); 
            } else {
                System.out.println("error price rate not set");
            }
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String priceRate = request.getParameter("newPriceRate");
        JourneyPriceRateDao priceDao = new JourneyPriceRateDao();
        priceDao.updateJourneyPriceRates(Double.parseDouble(priceRate));
        response.sendRedirect(request.getContextPath()+"/change-price");
    }

}
