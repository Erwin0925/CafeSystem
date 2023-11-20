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
    </head>
    <body>
        <header>
            <h1>Welcome to Our Food Service Customer Home Page</h1>
            <p>Hello, | <a href="login.jsp">Logout</a></p>
        </header>

        <nav>
            <ul>
                <li><a href="viewProfile.jsp">View Profile</a></li> <br><br>
                <li><a href="viewMenu.jsp">View Menu</a></li> <br><br>
                <li><a href="placeOrder.jsp">Place Order</a></li> <br><br>
                <li><a href="giveFeedback.jsp">Give Feedback</a></li> <br><br>
                <li><a href="orderHistory.jsp">Order History</a></li> <br><br>
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
