<%-- 
    Document   : stallearningreport
    Created on : Nov 29, 2023, 6:57:57 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manager Dashboard</title>
        <link rel="stylesheet" type="text/css" href="managershome.css">
        <link rel="stylesheet" type="text/css" href="managemanager.css">
    </head>
    <body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <h1>Manager Dashboard</h1>
            <form action="Logout" method="Post" class="logout-form">
                <input type="submit" value="Logout" class="logout-button">
            </form>
        </header>

        <nav class="dashboard-nav">
            <a href="LoadManageManager" class="dashboard-link">Manage Manager</a>
            <a href="LoadManageStallstaff" class="dashboard-link">Manage Stall Staff</a>
            <a href="LoadManageCustomer" class="dashboard-link">Customer Management</a>
            <a href="LoadRatingFeedback" class="dashboard-link">Feedback Analysis</a>
            <a href="LoadManagerReport" class="dashboard-link">Manager Information Report</a>
            <a href="LoadStallstaffReport" class="dashboard-link">Stallstaff Information Report</a>
            <a href="LoadCustomerReport" class="dashboard-link">Customer Information Report</a>
            <a href="LoadStallReport" class="dashboard-link">Stall Information Report</a>
            <a href="LoadStallEarningReport" class="dashboard-link">Stall Selling Report</a>
        </nav>

        <main class="dashboard-content">
            <h1>Total item sold by a Store</h1>
            <table border="1">
                <tr>
                    <th>Stall Name</th>
                    <th>Order Created</th>
                </tr>
                <c:forEach items="${stallOrderCounts}" var="entry">
                    <tr>
                        <td>${entry[0]}</td>
                        <td>${entry[1]}</td>
                    </tr>
                </c:forEach>
            </table><br><br>
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
