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
import model.Stalls;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.StallsFacade;
import model.modelfacade.StallstaffsFacade;
import model.modelfacade.UsersFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "StallStaffsRegister", urlPatterns = {"/StallStaffsRegister"})
public class StallStaffsRegister extends HttpServlet {

    @EJB
    private StallsFacade stallsFacade;

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
            try 
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String hp = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String stallname = request.getParameter("stallname");
                String status = "pending";
                String role = "Stallstaff";

                if (usersFacade.find(username) != null) {
                    throw new Exception();
                }
               
                Users newUser = new Users(username,password, role, status);
                usersFacade.create(newUser);
                
                Stallstaffs newStallstaff = new Stallstaffs(username, email, hp, address, gender, stallname);
                stallstaffsFacade.create(newStallstaff);

                // Find the existing stall by name (you might want to add error handling if it doesn't exist)
                Stalls existingStall = stallsFacade.find(stallname);

                // Add the new stall staff to the stall
                existingStall.getStallstaffs().add(newStallstaff);
                stallsFacade.edit(existingStall);
                request.setAttribute("success", "Registration Complete");
                request.getRequestDispatcher("login.jsp").include(request, response);
            } catch (Exception e) {
                request.setAttribute("fail", "Wrong Input/Username is in used");
                request.getRequestDispatcher("stallstaffsregister.jsp").include(request, response);

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
