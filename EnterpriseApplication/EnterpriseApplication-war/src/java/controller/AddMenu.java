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
import model.Stalls;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.MenusFacade;
import model.modelfacade.StallsFacade;
import model.modelfacade.StallstaffsFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "AddMenu", urlPatterns = {"/AddMenu"})
public class AddMenu extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

    @EJB
    private StallstaffsFacade stallstaffsFacade;

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
            
            Stallstaffs profile = stallstaffsFacade.findstallstaffdetails(userName);
            String stallname = profile.getStallname();
            String menuName = request.getParameter("menuName");
            double menuPrice = Double.parseDouble(request.getParameter("menuPrice"));
            String modify = userName;
            String status = "In Stock";

            Menus menuProf = new Menus(menuName, menuPrice, modify, stallname, status);
            menusFacade.create(menuProf);

            // Find the existing stall by name (you might want to add error handling if it doesn't exist)
            Stalls existingStall = stallsFacade.find(stallname);

            existingStall.getMenus().add(menuProf);
            stallsFacade.edit(existingStall);

            request.getRequestDispatcher("LoadStallstaffMenu").include(request, response);
            //request.getRequestDispatcher("LoadStallstaffMenu").include(request, response);
            out.println("<br><br><br>Registration Completed!");
            
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
