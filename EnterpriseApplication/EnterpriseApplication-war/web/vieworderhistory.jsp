<%-- 
    Document   : vieworderhistory
    Created on : Nov 28, 2023, 7:18:37 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Order History</title>
        <link rel="stylesheet" type="text/css" href="customershome.css">
        <script>
            function submitForm() {
                document.getElementById("orderForm").submit();
            }
        </script>
        <link rel="stylesheet" type="text/css" href="vieworderhistory.css">
    </head>
    <body>
        <div class="dashboard-container">
        <header class="dashboard-header">
            <h1>Customer Dashboard</h1>
            <form action="Logout" method="Post" class="logout-form">
                <input type="submit" value="Logout" class="logout-button">
            </form>
        </header>

        <nav class="dashboard-nav">
            <a href="LoadProfile" class="dashboard-link">View Profile</a>
            <a href="LoadCustomerMenu" class="dashboard-link">View Menu</a>
            <a class="dashboard-link">Order History</a>
        </nav>
            
        <main class="dashboard-content">  
        <h2>Order History</h2>
        <form id="orderForm" action="LoadOrderDetails" method="post">
            <div class="table-container">
                <table>
                    <tr>
                        <th>Select</th>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Payment Method</th>
                        <th>Total Price</th>
                        <th>Served By</th>
                        <th>Rating</th>
                        <th>Feedback</th>
                    </tr>
                    
                    <c:forEach items="${orderList}" var="order">
                        <tr>
                            <td>
                                <input type="radio" name="selectedOrder" value="${order.id}" onchange="submitForm()">
                            </td>
                            <td>${order.id}</td>
                            <td>${order.mydate}</td>
                            <td>${order.cardno}</td>
                            <td>${order.totalprice}</td>
                            <td>${order.stallstaffusername}</td>
                            <c:choose>
                                <c:when test="${order.status == 'empty'}">
                                    <td>N/A</td>
                                    <td>N/A</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${order.rating}</td>
                                    <td>${order.feedback}</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>

        <div class="table-container">
            <h3>Order Details</h3>
            <table>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                    </tr>
                    <%-- Assuming productList is a List of product objects --%>
                    <c:forEach items="${odprof}" var="od">
                        <tr>
                            <td>${od.name}</td>
                            <td>${od.price}</td>
                        </tr>
                    </c:forEach>
            </table>
        </div>

        <section class="feedback-section">
            <h3>Provide Rating and Feedback</h3>
            <form action="AddRatingFeedback" method="post" class="feedback-form">
                <label>Order ID :</label>
                <input type="text" name="orderId" value="${orderid}" readonly required><br><br>
                <label>Rating :</label>
                <input type="range" name="rating" min="1" max="10" oninput="this.nextElementSibling.value = this.value">
                <output>5</output> <!-- Default value --><br><br>
                <label>Feedback :</label>
                <input type="text" name="feedback" required><br><br>
                <input type="submit" value="Submit Rating and Feedback">
            </form>
            <% if (request.getAttribute("error") != null) { %>
            <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
        </section>
    </main>
        
        <footer class="dashboard-footer">
            <p>&copy; 2023 Food Service. All rights reserved.</p>
        </footer>
    </body>
</html>
