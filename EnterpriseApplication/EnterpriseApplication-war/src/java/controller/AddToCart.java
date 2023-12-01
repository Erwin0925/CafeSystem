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
import model.Menus;
import model.Users;
import model.modelfacade.CartsFacade;
import model.modelfacade.MenusFacade;
import model.modelfacade.StallsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    @EJB
    private StallsFacade stallsFacade;

    @EJB
    private MenusFacade menusFacade;

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
            String menuIdStr = request.getParameter("menuId");

            if (menuIdStr == null || menuIdStr.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Please select a menu to add to cart.");
                request.getRequestDispatcher("LoadCustomerMenu").include(request, response);
                return;
            }

            try {
                Long menuid = Long.parseLong(menuIdStr);
                Menus menuProf = menusFacade.find(menuid);

                if (menuProf == null) {
                    request.setAttribute("errorMessage", "Selected menu item not found.");
                    request.getRequestDispatcher("LoadCustomerMenu").include(request, response);
                    return;
                }

                String itemName = menuProf.getItemname();
                Double price = menuProf.getPrice();
                String stallName = menuProf.getStallname();
                String status = menuProf.getStatus();

                if ("Out Of Stock".equals(status)) {
                    request.setAttribute("errorMessage", "The item is currently out of stock.");
                } else if ("In Stock".equals(status)) {
                    Carts menu = new Carts(price, menuid, itemName, userName, stallName);
                    cartsFacade.create(menu);
                    System.out.println(price + " " + itemName);
                    request.setAttribute("successMessage", "Successfully added into Cart.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid menu ID format.");
            }

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
