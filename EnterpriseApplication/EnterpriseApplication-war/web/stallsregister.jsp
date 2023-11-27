<%-- 
    Document   : stallsregister
    Created on : Nov 27, 2023, 10:18:25 AM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Register New Stall</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="stallstaffsregister.jsp" class="back-button">Back</a><br><br>
        <h2>Register New Stall</h2>

        <form action="RegisterStall" method="post"> <!-- Action points to a Servlet that handles the saving -->
            <label for="stallName">Stall Name:</label>
            <input type="text" name="stallName" required size="20"><br><br>

            <label for="stallCategory">Stall Category:</label>
            <input type="text" name="category" required size="20"><br><br>

            <input type="submit" value="Register Stall">
        </form>
    </body>
</html>
