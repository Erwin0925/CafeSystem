<%-- 
    Document   : customerhome
    Created on : Nov 20, 2023, 6:48:10 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="customerdashboarddesign.css">
</head>
    <body>
        <div class="dashboard-container">
            <header class="dashboard-header">
                <h1>Customer Dashboard</h1>
                <form action="Logout" method="Post" class="logout-form">
                    <input type="submit" value="Logout" class="logout-button">
                </form>
            </header>

            <div class="dashboard-nav">
                <a href="LoadProfile" class="dashboard-link">View Profile</a>
                <a href="LoadCustomerMenu" class="dashboard-link">View Menu</a>
                <a href="LoadOrderHistory" class="dashboard-link">Order History</a>
            </div>

            <footer class="dashboard-footer">
                <p>&copy; 2023 Food Service. All rights reserved.</p>
            </footer>
        </div>
    </body>
</html>

