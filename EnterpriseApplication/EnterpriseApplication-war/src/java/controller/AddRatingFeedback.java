/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Orders;
import model.modelfacade.OrdersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "AddRatingFeedback", urlPatterns = {"/AddRatingFeedback"})
public class AddRatingFeedback extends HttpServlet {

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
        
        Long myid = Long.parseLong(request.getParameter("orderId"));
        Integer rating = Integer.parseInt(request.getParameter("rating"));
        String feedback = request.getParameter("feedback");
        
        try (PrintWriter out = response.getWriter()) {
            Orders orderpro = ordersFacade.find(myid);
            String status = orderpro.getStatus();
            
            if ("filled".equals(status)) {
                request.setAttribute("error", "You already filled up rating and feedback before");
            } else {
                // If status is not 'filled', update the order details
                orderpro.setStatus("filled");
                orderpro.setRating(rating);
                orderpro.setFeedback(feedback);
                ordersFacade.edit(orderpro);
            }
            request.getRequestDispatcher("LoadOrderHistory").forward(request, response);
            
            

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
