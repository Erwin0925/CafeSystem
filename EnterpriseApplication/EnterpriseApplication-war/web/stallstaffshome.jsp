<%-- 
    Document   : stallstaffshome
    Created on : Nov 20, 2023, 11:50:20 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Stallstaff Dashboard</title>
    <link rel="stylesheet" type="text/css" href="staffmenucss.css"> 
</head>
<body>
    <div id="dashboard-container">
        <div id="header">
            <h1>Stallstaff Dashboard</h1>
            <form id="logoutForm" action="Logout" method="POST">
                <input type="submit" value="Logout">
            </form>
        </div>

        <div id="menu-container">
            <div class="menu-item">
                <a href="LoadProfile">Edit Profile</a>
            </div>
            <div class="menu-item">
                <a href="LoadStallstaffMenu">Menu Management</a>
            </div>
            <div class="menu-item">
                <a href="managepayment.jsp">Manage Customer Payment</a>
            </div>
            <div class="menu-item">
                <a href="LoadViewStallstaffSales">View Rating</a>
            </div>
        </div>

        <div id="reports-container">
            <div class="report-item">
                <a href="LoadBusinessReport">Business Report</a>
            </div>
            <div class="report-item">
                <a href="LoadRatingFeedbackReport">Rating and Feedback Report</a>
            </div>
            <div class="report-item">
                <a href="LoadMenuSellingReport">Menu Selling Report</a>
            </div>
        </div>

        <div id="footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
