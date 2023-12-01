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
            
        </main>

        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
