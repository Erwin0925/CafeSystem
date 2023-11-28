/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Menus;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.MenusFacade;
import model.modelfacade.StallstaffsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "UpdateMenu", urlPatterns = {"/UpdateMenu"})
public class UpdateMenu extends HttpServlet {

    @EJB
    private StallstaffsFacade stallstaffsFacade;

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
            Long id = Long.parseLong(request.getParameter("menuIdToUpdate"));
            String newName = request.getParameter("updatedMenuName");
            double newPrice = Double.parseDouble(request.getParameter("updatedMenuPrice"));
            
            Stallstaffs profile = stallstaffsFacade.findstallstaffdetails(userName);
            String stallname = profile.getStallname();
            
            Menus menuProfile = menusFacade.findSpecificMenu(id);
            String stallname2 = menuProfile.getStallname();
            if(stallname.equals(stallname2)){
                menuProfile.setItemname(newName);
                menuProfile.setPrice(newPrice);
                menuProfile.setModifyby(userName);
                menusFacade.edit(menuProfile);
            }
            request.getRequestDispatcher("LoadStallstaffMenu").forward(request, response);              
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
