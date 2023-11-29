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
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <header>
            <h1>Manager Dashboard</h1>
            <form action = "Logout" method = "Post">
                <p>Welcome | <input type="submit" value="Logout"></p>
            </form>
        </header>

        <nav>
            <ul>
                <a href="LoadManageManager">Manage Manager</a><br><br>
                <a href="LoadManageStallstaff">Manage Stall Staff</a><br><br>
                <a href="LoadManageCustomer">Customer Management</a><br><br>
                <a href="LoadRatingFeedback">Feedback Analysis</a><br><br>
            </ul>
        </nav>

        <main>
            <section id="reports">
                <h2>Reports</h2>
                <ul>
                    <a href="LoadManagerReport">Manager Information Report</a><br><br>
                    <a href="LoadStallstaffReport">Stallstaff Information Report</a><br><br>
                    <a href="LoadCustomerReport">Customer Information Report</a><br><br>
                    <a href="LoadStallReport">Stall Information Report</a><br><br>
                    <a href="LoadStallEarningReport">Stall Selling Report</a><br><br>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
