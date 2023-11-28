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
        <title>Your Orders</title>
        <script>
            function submitForm() {
                document.getElementById("orderForm").submit();
            }
        </script>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="customershome.jsp" class="back-button">Back</a><br><br>
        <h2>Order History</h2>
        <form id="orderForm" action="LoadOrderDetails" method="post"> <!-- Replace with your servlet URL -->
            <table border="1">
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
                <%-- Assuming yourOrderList is a List of order objects --%>
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
                        <td>${order.rating}</td>
                        <td>${order.feedback}</td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <body>
            <table border="1">
                <br>
                <h3>Order Details</h3>
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
        </body>
        <h3>Provide Rating and Feedback</h3>
        <form action="AddRatingFeedback" method="post">
            <label>Order ID :</label>
            <input type="text" name="orderId" required><br><br>
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
        
    </body>
</html>
