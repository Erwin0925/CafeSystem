/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Stalls;
import model.Stallstaffs;
import model.modelfacade.StallsFacade;
import model.modelfacade.StallstaffsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "SelectStall", urlPatterns = {"/SelectStall"})
public class SelectStall extends HttpServlet {

    @EJB
    private StallstaffsFacade stallstaffsFacade;

    @EJB
    private StallsFacade stallsFacade;

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
        
        String stallName = request.getParameter("selectedStall");
        
        try (PrintWriter out = response.getWriter()) {
            
            Stalls stallList = stallsFacade.find(stallName);
            List<Stallstaffs> ssProf = stallList.getStallstaffs();
            
            List<Stallstaffs> ssProf2 = new ArrayList<>();
            for (Stallstaffs ss : ssProf) {
                // Get the ID from the current Stallstaffs object
                Long id = ss.getId();
                
                String userName = ss.getUsername();

                // Use the ID to find detailed Stallstaffs information
                List<Stallstaffs> detailedInfo = stallstaffsFacade.findstallstaffdetails3(userName);

                //Stallstaffs detailedInfo = stallstaffsFacade.find(id);
                
                // Add all the elements from detailedInfo to ssProf2
                if (detailedInfo != null && !detailedInfo.isEmpty()) {
                    ssProf2.addAll(detailedInfo);
                }
            }
            request.setAttribute("ssProf2",ssProf2);
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
