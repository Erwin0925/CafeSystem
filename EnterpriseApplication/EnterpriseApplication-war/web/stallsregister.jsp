<%-- 
    Document   : stallsregister
    Created on : Nov 27, 2023, 10:18:25 AM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register New Stall</title>
    <!-- Add any additional CSS or JS you need here -->
</head>
<body>

<h2>Register New Stall</h2>

<form action="SaveStallServlet" method="post"> <!-- Action points to a Servlet that handles the saving -->
    <label for="stallName">Stall Name:</label><br>
    <input type="text" id="stallName" name="stallName" required><br>

    <label for="stallCategory">Stall Category:</label><br>
    <input type="text" id="stallCategory" name="stallCategory" required><br><br>

    <input type="submit" value="Register Stall">
</form>

</body>
</html>
