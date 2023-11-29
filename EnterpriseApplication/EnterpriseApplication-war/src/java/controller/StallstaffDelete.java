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
@WebServlet(name = "StallstaffDelete", urlPatterns = {"/StallstaffDelete"})
public class StallstaffDelete extends HttpServlet {

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

            
            String stallstaffName = request.getParameter("stallUsername2");
            String status = request.getParameter("status2");

            Users userdetails = usersFacade.find(stallstaffName); //ggh
            
            
            Stallstaffs ssdetails = stallstaffsFacade.findstallstaffdetails(stallstaffName);
            String stallname = ssdetails.getStallname();

            

            Stalls existingStall = stallsFacade.find(stallname);
            
            existingStall.getStallstaffs().remove(ssdetails);
            stallsFacade.edit(existingStall);
            stallstaffsFacade.remove(ssdetails);
            
            usersFacade.remove(userdetails);
            
            request.getRequestDispatcher("LoadManageStallstaff").include(request, response);
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
