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
import model.Customers;
import model.modelfacade.CustomersFacade;
import model.Users;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "CustomersRegister", urlPatterns = {"/CustomersRegister"})
public class CustomersRegister extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

    @EJB
    private CustomersFacade customersFacade;
    
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
            try 
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String hp = request.getParameter("hp");
                String gender = request.getParameter("gender");
                String status = "approved";
                String role = "Customer";

                if (usersFacade.find(username) != null) {
                    throw new Exception();
                }
               
                Users newUser = new Users(username,password, role, status);
                usersFacade.create(newUser);
                
                
                

                Customers newCustomer = new Customers(username, email, hp, address, gender);
                // Create and persist the new user entity
                customersFacade.create(newCustomer);
                
                
                

                // Forward to the registration page with a success message
                //request.setAttribute("successMessage", "Registration Completed!");
                request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>Registration Completed!");
            } catch (Exception e) {
                // Forward back to the registration page with an error message
                //request.setAttribute("errorMessage", "Registration failed: " + e.getMessage());
                request.getRequestDispatcher("customersregister.jsp").include(request, response);
                out.println("<br><br><br>Wrong input!");
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
