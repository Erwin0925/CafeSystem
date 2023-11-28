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
import model.Carts;
import model.OrderDetails;
import model.Users;
import model.modelfacade.CartsFacade;
import model.modelfacade.OrderDetailsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "CreateOrderDetails", urlPatterns = {"/CreateOrderDetails"})
public class CreateOrderDetails extends HttpServlet {

    @EJB
    private OrderDetailsFacade orderDetailsFacade;

    @EJB
    private CartsFacade cartsFacade;
    

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
        
        try (PrintWriter out = response.getWriter()) {

            List<Carts> carts = cartsFacade.findByUsername(userName);
            request.setAttribute("carts", carts);
            
            List<Carts> cartsList = cartsFacade.findByUsername(userName);
            for (Carts cart : cartsList) {
                Long menuId = cart.getMenuid(); 
                String itemName = cart.getItemname(); 
                double price = cart.getPrice(); 
                String username = cart.getUsername(); 
                
                OrderDetails od = new OrderDetails(menuId, itemName, price, username,"green");
                orderDetailsFacade.create(od);
            }
            request.setAttribute("SM", "Successfully placed Order");
            
            for (Carts cart : carts) {
                cartsFacade.remove(cart); // Assuming delete method exists in cartsFacade
            }
            carts.clear();
            request.setAttribute("carts", carts);
            request.getRequestDispatcher("LoadCustomerMenu").include(request, response);
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
