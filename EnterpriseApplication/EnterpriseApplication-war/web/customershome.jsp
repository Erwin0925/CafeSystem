<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="customershome.css">
</head>
<body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <h1>Customer Dashboard</h1>
            <form action="Logout" method="Post" class="logout-form">
                <input type="submit" value="Logout" class="logout-button">
            </form>
        </header>

        <nav class="dashboard-nav">
            <a href="LoadProfile" class="dashboard-link">View Profile</a>
            <a href="LoadCustomerMenu" class="dashboard-link">View Menu</a>
            <a href="LoadOrderHistory" class="dashboard-link">Order History</a>
        </nav>

        <main class="dashboard-content">
            
        </main>

        <footer class="dashboard-footer">
            <p>&copy; 2023 Food Service. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
