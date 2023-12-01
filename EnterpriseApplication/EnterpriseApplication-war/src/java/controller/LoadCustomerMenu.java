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
import model.Stalls;
import model.Users;
import model.modelfacade.CartsFacade;
import model.modelfacade.MenusFacade;
import model.modelfacade.StallsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "LoadCustomerMenu", urlPatterns = {"/LoadCustomerMenu"})
public class LoadCustomerMenu extends HttpServlet {

    @EJB
    private CartsFacade cartsFacade;

    @EJB
    private StallsFacade stallsFacade;

    @EJB
    private MenusFacade menusFacade;

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
            
            List<Stalls> stallList = stallsFacade.findAll(); // Fetch all stalls
            request.setAttribute("stallList", stallList);

            String selectedStall = request.getParameter("stallname");
            if (selectedStall != null && !selectedStall.isEmpty()) {
                List<Menus> menuList = menusFacade.findsMenu2(selectedStall); // Method to implement in facade
                request.setAttribute("menuList", menuList);
            }
            
            List<Carts> cartprof = cartsFacade.findByUsername(userName);
                request.setAttribute("cartprof",cartprof);
            
            List<Carts> carts = cartsFacade.findByUsername(userName);
            request.setAttribute("carts", carts);
            request.getRequestDispatcher("customerviewmenu.jsp").forward(request, response);
            
            
            

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
