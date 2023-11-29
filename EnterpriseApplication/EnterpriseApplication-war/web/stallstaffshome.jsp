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
                <a href="LoadStallstaffMenu">Menu Management</a><br><br>
                <a href="managepayment.jsp">Manage Customer Payment</a><br><br>
                <a href="LoadViewStallstaffSales">View Ratings</a><br><br>
            </ul>
        </nav>
            <section id="reports">
                <h2>Analyzed Reports</h2>
                <ul>
                    <a href="LoadBusinessReport">Business Report</a><br><br>
                    <a href="LoadRatingFeedbackReport">Personal Customer Engagement Report</a><br><br>
                    <a href="dailyOperationsSummary.jsp">Daily Operations Summary</a><br><br>
                    <a href="monthlySalesReport.jsp">Monthly Sales Report</a><br><br>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
