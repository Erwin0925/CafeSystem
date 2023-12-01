<%-- 
    Document   : managepayment
    Created on : Nov 28, 2023, 4:16:36 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Stallstaff Dashboard</title>
    <link rel="stylesheet" type="text/css" href="stallstaffshome.css"> 
    <link rel="stylesheet" type="text/css" href="managemanager.css">
</head>
<body>
    <div id="dashboard-container">
        <div id="header">
            <h1>Stallstaff Dashboard</h1>
            <form id="logoutForm" action="Logout" method="POST">
                <input type="submit" value="Logout" id="logout-button">
            </form>
        </div>

        <div id="navigation">
            <a href="LoadProfile" class="nav-item">Edit Profile</a>
            <a href="LoadStallstaffMenu" class="nav-item">Menu Management</a>
            <a href="LoadManagePayment" class="nav-item">Manage Customer Payment</a>
            <a href="LoadViewStallstaffSales" class="nav-item">View Rating</a>
            <a href="LoadBusinessReport" class="nav-item">Business Report</a>
            <a href="LoadRatingFeedbackReport" class="nav-item">Rating and Feedback Report</a>
            <a href="LoadMenuSellingReport" class="nav-item">Menu Selling Report</a>
        </div>
        
        <main class="dashboard-content">
            <h1>Serch Customer Order</h1>
            <form action="ManagePayment" method="post">
                <label for="cusUsername">Customer Username:</label>
                <select name="cusUsername" id="cusUsername" required>
                    <c:forEach items="${userprof}" var="user">
                        <option value="${user.username}">${user.username}</option>
                    </c:forEach>
                </select><br><br>
                <input type="submit" value="Search">
            </form>

            <c:choose>
                <c:when test="${not empty orderdetailList}">
                    <h3>Customer's Order Details</h3>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderdetail" items="${orderdetailList}">
                                <tr>
                                    <td>${orderdetail.name}</td>
                                    <td>${orderdetail.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <!-- You can put some message or nothing here if the list is empty -->
                </c:otherwise>
            </c:choose>

            <form action="ProcessPayment" method="post">
                <div>
                    <hr>
                    <h3 class="managerreport">Total Amount: RM${totalAmount}</h3>
                    <hr>
                    <input type="hidden" name="totalAmount" value="${totalAmount}" />
                    <h2>Customer's Username: ${cusUsername}</h2>
                    <input type="hidden" name="cusUsername" value="${cusUsername}" />
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" required>
                </div>
                <div>
                    <label for="csv">CSV:</label>
                    <input type="text" id="csv" name="csv" required>
                </div>
                <div>
                    <label for="expiryDate">Expiry Date:</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div>
                    <label for="holderName">Card Holder Name:</label>
                    <input type="text" id="holderName" name="holderName" required>
                </div>
                <c:if test="${showPaymentButton}">
                    <div>
                        <input type="submit" value="Make Payment"><br><br>
                    </div>
                </c:if>
            </form>
            <% if (request.getAttribute("msg") != null) { %>
            <p style="color: green;"><%= request.getAttribute("msg") %></p>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
            <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
            
            <c:if test="${not empty total}">
                <h2>Receipt Details</h2>
                <table>
                    <tr>
                        <td>Stall name:</td>
                        <td>${stallname}</td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td>${mydate}</td>
                    </tr>
                    <tr>
                        <td>Customer Name:</td>
                        <td>${customername}</td>
                    </tr>
                    <tr>
                        <td>Total:</td>
                        <td>RM${total}</td>
                    </tr>
                    <tr>
                        <td>Serve By:</td>
                        <td>${serveby}</td>
                    </tr>
                </table>
            </c:if>
            
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
        
    </body>
</html>
