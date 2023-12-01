<%-- 
    Document   : ratingfeedbackanalysis
    Created on : Nov 29, 2023, 2:43:31 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Rating Feedback Analysis</title>
        <link rel="stylesheet" type="text/css" href="managershome.css">
    </head>
    <body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <h1>Manager Dashboard</h1>
            <form action="Logout" method="Post" class="logout-form">
                <input type="submit" value="Logout" class="logout-button">
                <link rel="stylesheet" type="text/css" href="managemanager.css">
            </form>
        </header>

        <nav class="dashboard-nav">
            <a href="LoadManageManager" class="dashboard-link">Manage Manager</a>
            <a href="LoadManageStallstaff" class="dashboard-link">Manage Stall Staff</a>
            <a href="LoadManageCustomer" class="dashboard-link">Customer Management</a>
            <a class="dashboard-link">Feedback Analysis</a>
            <a href="LoadManagerReport" class="dashboard-link">Manager Information Report</a>
            <a href="LoadStallstaffReport" class="dashboard-link">Stallstaff Information Report</a>
            <a href="LoadCustomerReport" class="dashboard-link">Customer Information Report</a>
            <a href="LoadStallReport" class="dashboard-link">Stall Information Report</a>
            <a href="LoadStallEarningReport" class="dashboard-link">Stall Selling Report</a>
        </nav>

        <main class="dashboard-content">
            <h1>Stalls Feedback and Rating</h1>
            <form action="AnalysisDetails" method="post">
                <table border="1">
                    <tr>
                        <th>Select</th>
                        <th>Stall</th>
                        <th>Average Rating</th>
                    </tr>
                    <c:forEach items="${stallRatings}" var="stall">
                        <tr>
                            <td><input type="radio" name="selectedStall" value="${stall.key}"></td>
                            <td>${stall.key}</td>
                            <td>${stall.value}</td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <input type="submit" value="Show Feedback">
            </form>

            <c:if test="${not empty orderdtl}">
                <h2>Feedback for Selected Stall</h2>
                <table border="1">
                    <tr>
                        <th>Order Id</th>
                        <th>Rating</th>
                        <th>Feedback</th>
                    </tr>
                    <c:forEach items="${orderdtl}" var="feedback">
                        <tr>
                            <td>${feedback.id}</td>
                            <c:choose>
                                <c:when test="${feedback.status == 'empty'}">
                                    <td>User not yet fill</td>
                                    <td>User not yet fill</td>
                                </c:when>
                                <c:when test="${feedback.status == 'filled'}">
                                    <td>${feedback.rating}</td>
                                    <td>${feedback.feedback}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Unknown status</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
