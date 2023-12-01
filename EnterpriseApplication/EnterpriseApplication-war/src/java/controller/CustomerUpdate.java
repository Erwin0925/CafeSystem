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
import model.Users;
import model.modelfacade.CustomersFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "CustomerUpdate", urlPatterns = {"/CustomerUpdate"})
public class CustomerUpdate extends HttpServlet {

    @EJB
    private CustomersFacade customersFacade;

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
            
            String cusName = request.getParameter("cusUsername3");
            String newPassword = request.getParameter("password");
            String newAddress = request.getParameter("address");
            String newEmail = request.getParameter("email");
            String newHp = request.getParameter("hp");
            String newGender = request.getParameter("gender"); 

            // Regular expression for phone number validation
            String phoneRegex = "\\d{10,11}";

            if (!newHp.matches(phoneRegex)) {
                // If phone number doesn't match the regex, set an error attribute and redirect
                request.setAttribute("fail3", "Invalid phone number. Phone number must be 10 or 11 digits.");
                request.getRequestDispatcher("LoadManageCustomer").include(request, response);
                return; // Stop further execution
            }

            Users userProf = usersFacade.find(cusName);
            Customers cusProf = customersFacade.findcustomerdetails(cusName);

            if (userProf != null && cusProf != null) {
                userProf.setPassword(newPassword);
                usersFacade.edit(userProf);
                cusProf.setAddress(newAddress);
                cusProf.setEmail(newEmail);
                cusProf.setGender(newGender);
                cusProf.setHp(newHp);
                customersFacade.edit(cusProf);
                request.setAttribute("done3", "Done Changes");
            } else {
                request.setAttribute("fail3", "Customer username not found");
            }

            request.getRequestDispatcher("LoadManageCustomer").include(request, response);
        } catch (Exception e) {
            // Handle other exceptions if needed
            request.setAttribute("error", "An error occurred while updating the profile.");
            request.getRequestDispatcher("LoadManageCustomer").include(request, response);
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
