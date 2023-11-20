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
    <!-- Add your CSS file link here -->
</head>
    <body>
        <header>
            <h1>Stallstaff Dashboard</h1>
            <p>Welcome, <%= request.getSession().getAttribute("stallstaffName") %> | <a href="login.jsp">Logout</a></p>
        </header>

        <nav>
            <ul>
                <li><a href="editProfile.jsp">Edit Profile</a></li>
                <li><a href="menuManagement.jsp">Menu Management</a></li>
                <li><a href="salesRecords.jsp">Sales Records</a></li>
                <li><a href="viewRatings.jsp">View Ratings</a></li>
                <li><a href="reporting.jsp">Reporting</a></li>
            </ul>
        </nav>

        <main>
            <section id="profile-overview">
                <h2>Your Profile</h2>
                <!-- Profile overview goes here -->
            </section>

            <section id="menu-management">
                <h2>Menu Management</h2>
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
