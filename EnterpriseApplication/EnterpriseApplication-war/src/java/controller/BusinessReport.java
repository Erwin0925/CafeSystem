/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.OrdersFacade;
import model.modelfacade.StallstaffsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "BusinessReport", urlPatterns = {"/BusinessReport"})
public class BusinessReport extends HttpServlet {

    @EJB
    private StallstaffsFacade stallstaffsFacade;

    @EJB
    private OrdersFacade ordersFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(false);
        Users loginUser = (Users)s.getAttribute("loginUser");
        String userName = loginUser.getUsername(); 
        Stallstaffs ssProf = stallstaffsFacade.findstallstaffdetails(userName);
        String stallName = ssProf.getStallname();
        
        try (PrintWriter out = response.getWriter()) {
            
            String reportType = request.getParameter("reportType");
            Date date = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date midnightDate = calendar.getTime();  

            List<Object[]> reportData;
            switch (reportType) {
                case "today":
                    reportData = ordersFacade.getDailyReport(stallName, midnightDate);
                    break;
                case "weekly":
                    reportData = ordersFacade.getWeeklyReport(stallName, date);
                    break;
                case "monthly":
                    reportData = ordersFacade.getMonthlyReport(stallName, date);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid report type");
            }
            
            double total = 0.0;
            for (Object[] row : reportData) {
                total += ((Number) row[2]).doubleValue(); 
            }            
            request.setAttribute("reportDataTotal", total);
            
            
            request.setAttribute("reportData", reportData);
            RequestDispatcher dispatcher = request.getRequestDispatcher("businessreport.jsp");
            dispatcher.forward(request, response);            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
