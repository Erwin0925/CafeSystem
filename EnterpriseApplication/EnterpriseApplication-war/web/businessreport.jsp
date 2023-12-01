<%-- 
    Document   : SellingReport
    Created on : Nov 29, 2023, 7:31:56 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h1>Business Report</h1>
                <table border="1">
                    <tr>
                        <th>Order ID</th>
                        <th>Day Sold</th>
                        <th>Total Earn</th>
                    </tr>
                    <c:forEach var="row" items="${reportData}">
                        <tr>
                            <td><c:out value="${row[0]}" /></td>
                            <td><fmt:formatDate value="${row[1]}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="RM${row[2]}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            <h3>Total Earning = RM${reportDataTotal}</h3>
            <form action="BusinessReport" method="get">
                <select name="reportType">
                    <option value="today">Today</option>
                    <option value="weekly">Weekly</option>
                    <option value="monthly">Monthly</option>
                </select>
                <input type="submit" value="Show Report">
            </form>
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
    </div>        
</body>
</html>
