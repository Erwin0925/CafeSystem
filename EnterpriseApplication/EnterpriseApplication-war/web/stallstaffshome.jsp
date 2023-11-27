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
    <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
</head>
    <body>
        <header>
            <h1>Stallstaff Dashboard</h1>
            <form action = "Logout" method = "Post">
                <p>Welcome | <input type="submit" value="Logout"></p>
            </form>
            <link rel="stylesheet" type="text/css" href="cssstyle.css">
        </header>

        <nav>
            <ul>
                <a href="LoadProfile">Edit Profile</a><br><br>
                <a href="menumanagement.jsp">Menu Management</a><br><br>
                <a href="salesRecords.jsp">Sales Records</a><br><br>
                <a href="viewRatings.jsp">View Ratings</a><br><br>
                <a href="reporting.jsp">Reporting</a><br><br>
            </ul>
        </nav>

        <main>
            <section id="profile-overview">
                <h2>Your Profile</h2>
                <!-- Profile overview goes here -->
            </section>

            <section id="menu-management">
                <h2>Menu Managements</h2>
                <!-- Quick links for menu management -->
            </section>

            <section id="sales-and-ratings">
                <h2>Sales and Ratings Overview</h2>
                <!-- Summary of sales records and ratings -->
            </section>

            <section id="reports">
                <h2>Analyzed Reports</h2>
                <ul>
                    <li><a href="menuManagementReport.jsp">Menu Management Report</a></li>
                    <li><a href="customerEngagementReport.jsp">Personal Customer Engagement Report</a></li>
                    <li><a href="profileUpdatesReport.jsp">Personal Profile Updates Report</a></li>
                    <li><a href="dailyOperationsSummary.jsp">Daily Operations Summary</a></li>
                    <li><a href="monthlySalesReport.jsp">Monthly Sales Report</a></li>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
