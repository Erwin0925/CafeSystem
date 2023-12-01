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
import model.Managers;
import model.Users;
import model.modelfacade.ManagersFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "AddManager", urlPatterns = {"/AddManager"})
public class AddManager extends HttpServlet {

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
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String hp = request.getParameter("hp");
                String gender = request.getParameter("gender");
                String status = "approved";
                String role = "Manager";

                // Regular expression for phone number validation
                String phoneRegex = "\\d{10,11}";

                if (!hp.matches(phoneRegex)) {
                    // If phone number doesn't match the regex, set an error attribute and redirect
                    request.setAttribute("fail", "Invalid phone number. Phone number must be 10 or 11 digits.");
                    request.getRequestDispatcher("LoadManageManager").include(request, response);
                    return; // Stop further execution
                }

                if (usersFacade.find(username) != null) {
                    throw new Exception();
                }

                Users newUser = new Users(username, password, role, status);
                usersFacade.create(newUser);

                Managers newManager = new Managers(username, email, hp, address, gender);
                managersFacade.create(newManager);

                request.setAttribute("done", "Register successfully");
                request.getRequestDispatcher("LoadManageManager").include(request, response);

            } catch (Exception e) {
                request.setAttribute("fail", "Please try again with another username");
                request.getRequestDispatcher("LoadManageManager").include(request, response);
            }
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
