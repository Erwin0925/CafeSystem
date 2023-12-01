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
import model.Stallstaffs;
import model.Users;
import model.modelfacade.StallstaffsFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "StallstaffUpdate", urlPatterns = {"/StallstaffUpdate"})
public class StallstaffUpdate extends HttpServlet {

    @EJB
    private StallstaffsFacade stallstaffsFacade;

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
            String stallstaffName = request.getParameter("stallUsername4");
            String newPassword = request.getParameter("password");
            String newAddress = request.getParameter("address");
            String newEmail = request.getParameter("email");
            String newHp = request.getParameter("hp");
            String newGender = request.getParameter("gender");  

            // Regular expression for phone number validation
            String phoneRegex = "\\d{10,11}";

            if (!newHp.matches(phoneRegex)) {
                request.setAttribute("fail3", "Invalid phone number. Phone number must be 10 or 11 digits.");
                request.getRequestDispatcher("LoadManageStallstaff").include(request, response);
                return; // Stop further execution if the phone number is not valid
            }

            Users userProf = usersFacade.find(stallstaffName);
            Stallstaffs ssProf = stallstaffsFacade.findstallstaffdetails(stallstaffName);

            if (userProf != null && ssProf != null) {
                userProf.setPassword(newPassword);
                usersFacade.edit(userProf);
                ssProf.setAddress(newAddress);
                ssProf.setEmail(newEmail);
                ssProf.setGender(newGender);
                ssProf.setHp(newHp);
                stallstaffsFacade.edit(ssProf);
                request.setAttribute("done3", "Done Changes");

                System.out.println(ssProf.getEmail());
                System.out.println(userProf.getPassword());

                request.getRequestDispatcher("LoadManageStallstaff").include(request, response);
            } else {
                request.setAttribute("fail3", "Stallstaff username not found");
                request.getRequestDispatcher("LoadManageStallstaff").include(request, response);
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
