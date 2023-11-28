<%-- 
    Document   : customerhome
    Created on : Nov 20, 2023, 6:48:10 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Dashboard</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <header>
            <h1>Customer Home Page</h1>
            <form action = "Logout" method = "Post">
                <p>Welcome | <input type="submit" value="Logout"></p>
            </form>
        </header>

        <nav>
            <ul>
                <a href="LoadProfile">View Profile</a> <br><br>
                <a href="LoadCustomerMenu">View Menu</a><br><br>
                <a href="giveFeedback.jsp">Give Feedback</a> <br><br>
                <a href="orderHistory.jsp">Order History</a> <br><br>
            </ul>
        </nav>

        <main>
            <section id="profile-summary">
                <h2>Your Profile</h2>
                <!-- Profile summary goes here -->
            </section>

            <section id="menu-overview">
                <h2>Menu Overview</h2>
                <!-- Menu items display here -->
            </section>

            <section id="recent-orders">
                <h2>Recent Orders</h2>
                <!-- Recent orders summary goes here -->
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Food Service. All rights reserved.</p>
        </footer>
    </body>
</html>
