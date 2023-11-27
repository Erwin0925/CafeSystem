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
import model.Customers;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.CustomersFacade;
import model.modelfacade.StallstaffsFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

    @EJB
    private StallstaffsFacade stallstaffsFacade;

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
        
        HttpSession s = request.getSession(false);
        Users loginUser = (Users)s.getAttribute("loginUser");
        String userName = loginUser.getUsername();
        String userType= loginUser.getRole();
        String pw= loginUser.getPassword();
        
        String newEmail = request.getParameter("email");
        String newAddress = request.getParameter("address");
        String newPhone = request.getParameter("phone");
        String newGender = request.getParameter("gender");
        String newPassword = request.getParameter("password");
        
        try (PrintWriter out = response.getWriter()) {
            Users userProfile = usersFacade.find(userName);
            userProfile.setPassword(newPassword);
            usersFacade.edit(userProfile);
            
            if ("Customer".equalsIgnoreCase(userType)){
                Customers customerProfile = customersFacade.findcustomerdetails(userName);
                customerProfile.setEmail(newEmail);
                customerProfile.setAddress(newAddress);
                customerProfile.setGender(newGender);
                customerProfile.setHp(newPhone);
                customersFacade.edit(customerProfile);
            }else if("Stallstaff".equalsIgnoreCase(userType)){
                Stallstaffs stallstaffProfile = stallstaffsFacade.findstallstaffdetails(userName);
                stallstaffProfile.setEmail(newEmail);
                stallstaffProfile.setAddress(newAddress);
                stallstaffProfile.setGender(newGender);
                stallstaffProfile.setHp(newPhone);
                // Update other profile attributes as needed
                stallstaffsFacade.edit(stallstaffProfile);
            }
            request.getRequestDispatcher("LoadProfile").forward(request, response);

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
