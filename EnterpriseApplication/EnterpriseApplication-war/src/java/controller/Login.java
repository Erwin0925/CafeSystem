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
import model.Users;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            Users found = usersFacade.find(username);
            if (found == null) {
                throw new Exception("User not found");
            }
            String password = request.getParameter("password");
            if (!password.equals(found.getPassword())) {
                throw new Exception("Invalid password");
            }

            // Check the user's status
            String status = found.getStatus();
            if ("pending".equalsIgnoreCase(status)) {
                request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>Account pending approval. Please wait.");
                return;
            } else if (!"approved".equalsIgnoreCase(status)) {
                throw new Exception("Account not approved or recognized.");
            }
            
            HttpSession s = request.getSession();
            s.setAttribute("loginUser", found);

            // Determine which homepage to redirect based on the user's role
            String userRole = found.getRole();
            System.out.println(userRole);
            switch (userRole) {
                case "Customer":
                    request.getRequestDispatcher("LoadProfile").include(request, response);
                    break;
                case "Manager":
                    request.getRequestDispatcher("managershome.jsp").include(request, response);
                    break;
                case "Stallstaff":
                    request.getRequestDispatcher("stallstaffshome.jsp").include(request, response);
                    break;
                default:
                    throw new Exception("Invalid role");
            }

            } catch (Exception e) {
                request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>" + e.getMessage());
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
