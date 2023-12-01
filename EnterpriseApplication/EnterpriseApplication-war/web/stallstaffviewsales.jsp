<%-- 
    Document   : stallstaffviewsales
    Created on : Nov 28, 2023, 10:25:00 PM
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
            <h2 class="managerreport">Individual Sales Records & Ratings of : ${userName}</h2>
            <table class="table-2 order-list-table order-list-table">
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total Price</th>
                    <th>Rating</th>
                </tr>
                <c:forEach items="${orderprof}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.mydate}</td>
                        <td>RM${order.totalprice}</td>
                    <c:choose>
                        <c:when test="${order.status == 'empty'}">
                            <td>User not yet filled</td>
                        </c:when>
                        <c:when test="${order.status == 'filled'}">
                            <td>${order.rating}</td>
                        </c:when>
                        <c:otherwise>
                            <td>Unknown status</td>
                        </c:otherwise>
                    </c:choose>
                    </tr>
                </c:forEach>
            </table>
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
