/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderDetails;
import model.Users;
import model.modelfacade.OrderDetailsFacade;
import model.modelfacade.OrdersFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "ManagePayment", urlPatterns = {"/ManagePayment"})
public class ManagePayment extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private OrderDetailsFacade orderDetailsFacade;

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
        String stallstaffUserName = loginUser.getUsername();
        String cusUsername = request.getParameter("cusUsername");
        
        try (PrintWriter out = response.getWriter()) {
            
            List<OrderDetails> orderdetailList = orderDetailsFacade.findByUsername(cusUsername);
            request.setAttribute("orderdetailList", orderdetailList);

            double totalAmount = 0.0;
            boolean hasError = false;
            for (OrderDetails orderdetails : orderdetailList) {
                if ("red".equals(orderdetails.getStatus())) {
                    hasError = true;
                    break; 
                }
                totalAmount += orderdetails.getPrice(); 
            }

            if (hasError) {
                request.setAttribute("error", "No order made by this customer");
            } else {
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("cusUsername", cusUsername);
            }

            request.getRequestDispatcher("LoadManagePayment").forward(request, response);

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
