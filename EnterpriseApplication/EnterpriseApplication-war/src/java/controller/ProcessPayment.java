/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderDetails;
import model.Orders;
import model.Stallstaffs;
import model.Users;
import model.modelfacade.OrderDetailsFacade;
import model.modelfacade.OrdersFacade;
import model.modelfacade.StallstaffsFacade;

/**
 *
 * @author Erwin_Yoga
 */
@WebServlet(name = "ProcessPayment", urlPatterns = {"/ProcessPayment"})
public class ProcessPayment extends HttpServlet {

    @EJB
    private StallstaffsFacade stallstaffsFacade;

    @EJB
    private OrderDetailsFacade orderDetailsFacade;

    @EJB
    private OrdersFacade ordersFacade;

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
        
        Stallstaffs sf = stallstaffsFacade.findstallstaffdetails(userName);
        String stallname = sf.getStallname();
        
        String cusUsername = request.getParameter("cusUsername");
        //Long cardNo = Long.parseLong(request.getParameter("cardNumber"));
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        int rating = 0;
        String Feedback = "";
        String status = "empty";
        String status2 = "new";
        Date mydate = new Date();
        
        String cardNoStr = request.getParameter("cardNumber");
        String csvStr = request.getParameter("csv");
        String expiryDate = request.getParameter("expiryDate");
        String cardowner = request.getParameter("holderName");

        // Validation regex patterns
        String cardNoRegex = "\\d{16}";
        String csvRegex = "\\d{3}";
        String expiryDateRegex = "(0[1-9]|1[0-2])/(2[2-9]|[3-9][0-9])"; // MM/YY format, starting from 22 to 99
        String cardOwnerRegex = "^[a-zA-Z\\s]+$";
        
        
        try (PrintWriter out = response.getWriter()) {
            
            if (!cardNoStr.matches(cardNoRegex)) {
                request.setAttribute("error", "Invalid card number. Card number must be 16 digits.");
                request.getRequestDispatcher("LoadManagePayment").include(request, response);
                return;
            }

            if (!csvStr.matches(csvRegex)) {
                request.setAttribute("error", "Invalid CSV. CSV must be 3 digits.");
                request.getRequestDispatcher("LoadManagePayment").include(request, response);
                return;
            }

            if (!expiryDate.matches(expiryDateRegex)) {
                request.setAttribute("error", "Invalid expiry date. Format must be MM/YY (01/22 to 12/99).");
                request.getRequestDispatcher("LoadManagePayment").include(request, response);
                return;
            }

            if (!cardowner.matches(cardOwnerRegex)) {
                request.setAttribute("error", "Invalid card owner name. Only alphabets and spaces are allowed.");
                request.getRequestDispatcher("LoadManagePayment").include(request, response);
                return;
            }
            
            Long cardNo = Long.parseLong(cardNoStr);
            
            Orders orderProf = new Orders(mydate, rating, Feedback, cusUsername, totalAmount, status, status2, userName, cardNo, stallname);
            ordersFacade.create(orderProf);
            
            Orders existingOrder = ordersFacade.findByUsernameAndStatusNew(cusUsername);
            existingOrder.setStatus2("old");
            ordersFacade.edit(existingOrder);
            
            List<OrderDetails> orderdetailList = orderDetailsFacade.findByUsername(cusUsername);
            for (OrderDetails orderdetails : orderdetailList) {
                existingOrder.getOrderDetails().add(orderdetails);
                ordersFacade.edit(existingOrder);
                orderdetails.setStatus("red");
                orderDetailsFacade.edit(orderdetails);
            }
            request.setAttribute("msg", "Successfully Pay");
            request.setAttribute("mydate", mydate);
            request.setAttribute("total", totalAmount);
            request.setAttribute("stallname", stallname);
            request.setAttribute("customername", cusUsername);
            request.setAttribute("serveby", userName);
            request.getRequestDispatcher("LoadManagePayment").include(request, response);
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
