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
                <a href="manageStaff.jsp">Manage Manager</a><br><br>
                <a href="approveStallStaff.jsp">Approve Stall Staff</a><br><br>
                <a href="customerManagement.jsp">Customer Management</a><br><br>
                <a href="feedbackAnalysis.jsp">Feedback Analysis</a><br><br>
                <a href="reporting.jsp">Reporting</a><br><br>
            </ul>
        </nav>

        <main>
            <section id="reports">
                <h2>Reports</h2>
                <ul>
                    <a href="managerInfoReport.jsp">Manager Information Report</a><br><br>
                    <a href="stallStaffInfoReport.jsp">Stallstaff Information Report</a><br><br>
                    <a href="customerInfoReport.jsp">Customer Information Report</a><br><br>
                    <a href="ratingFeedbackReport.jsp">Rating and Feedback Analysis Report</a><br><br>
                    <a href="stallSellingReport.jsp">Stall Selling Report</a><br><br>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
