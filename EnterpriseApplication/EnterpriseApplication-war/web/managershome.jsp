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
        <!-- Add your CSS file link here -->
    </head>
    <body>
        <header>
            <h1>Manager Dashboard</h1>
            <p>Welcome, <%= request.getSession().getAttribute("managerName") %> | <a href="login.jsp">Logout</a></p>
        </header>

        <nav>
            <ul>
                <li><a href="manageStaff.jsp">Manage Staff</a></li>
                <li><a href="approveStallStaff.jsp">Approve Stall Staff</a></li>
                <li><a href="customerManagement.jsp">Customer Management</a></li>
                <li><a href="feedbackAnalysis.jsp">Feedback Analysis</a></li>
                <li><a href="reporting.jsp">Reporting</a></li>
            </ul>
        </nav>

        <main>
            <section id="quick-actions">
                <h2>Quick Actions</h2>
                <!-- Buttons for add, delete, search, update staff -->
            </section>

            <section id="dashboard">
                <h2>Dashboard</h2>
                <!-- Display visual summaries here -->
            </section>

            <section id="reports">
                <h2>Reports</h2>
                <ul>
                    <li><a href="managerInfoReport.jsp">Manager Information Report</a></li>
                    <li><a href="stallStaffInfoReport.jsp">Stallstaff Information Report</a></li>
                    <li><a href="customerInfoReport.jsp">Customer Information Report</a></li>
                    <li><a href="ratingFeedbackReport.jsp">Rating and Feedback Analysis Report</a></li>
                    <li><a href="stallSellingReport.jsp">Stall Selling Report</a></li>
                    <li><a href="bestSellingFoodReport.jsp">Best Selling Food Report</a></li>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>
