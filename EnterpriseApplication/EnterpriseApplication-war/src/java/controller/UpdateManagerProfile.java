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
import model.Managers;
import model.Users;
import model.modelfacade.ManagersFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "UpdateManagerProfile", urlPatterns = {"/UpdateManagerProfile"})
public class UpdateManagerProfile extends HttpServlet {

    @EJB
    private ManagersFacade managersFacade;

    @EJB
    private UsersFacade usersFacade;

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
        try (PrintWriter out = response.getWriter()) {

            String userName = request.getParameter("username");
            String newPassword = request.getParameter("password");
            String newAddress = request.getParameter("address");
            String newEmail = request.getParameter("email");
            String newHp = request.getParameter("hp");
            String newGender = request.getParameter("gender");
            
            Users userProf = usersFacade.find(userName);
            Managers managerProf = managersFacade.findmanagerdetails(userName);
            
            if (userProf != null) {
                userProf.setPassword(newPassword);
                usersFacade.edit(userProf);
                managerProf.setAddress(newAddress);
                managerProf.setEmail(newEmail);
                managerProf.setGender(newGender);
                managerProf.setHp(newHp);
                managersFacade.edit(managerProf);
                request.setAttribute("done3", "Done Changes");
            } else {
                request.setAttribute("fail3", "Wrong Username");
            } 

            request.getRequestDispatcher("LoadManageManager").include(request, response);
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
