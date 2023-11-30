<%-- 
    Document   : managershome
    Created on : Nov 20, 2023, 11:45:41 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manager Dashboard</title>
        <link rel="stylesheet" type="text/css" href="managerdashboarddesign.css">
    </head>
    <body>
        <div class="dashboard-header">
            <h1>Manager Dashboard</h1>
            <form action="Logout" method="POST" class="logout-form">
                <button type="submit" class="logout-button">Logout</button>
            </form>
        </div>

        <div class="dashboard-main">
            <div class="grid-container">
                <a href="LoadManageManager" class="grid-item">Manage Manager</a>
                <a href="LoadManageStallstaff" class="grid-item">Manage Stall Staff</a>
                <a href="LoadManageCustomer" class="grid-item">Customer Management</a>
                <a href="LoadRatingFeedback" class="grid-item">Feedback Analysis</a>
            </div>

            <div class="reports-row">
                <a href="LoadManagerReport" class="report-item">Manager Information Report</a>
                <a href="LoadStallstaffReport" class="report-item">Stallstaff Information Report</a>
                <a href="LoadCustomerReport" class="report-item">Customer Information Report</a>
                <a href="LoadStallReport" class="report-item">Stall Information Report</a>
                <a href="LoadStallEarningReport" class="report-item">Stall Selling Report</a>
            </div>
        </div>

        <footer>
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
