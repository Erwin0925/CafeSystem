<%-- 
    Document   : stallsregister
    Created on : Nov 27, 2023, 10:18:25 AM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New Stall</title>
        <link rel="stylesheet" type="text/css" href="register.css"> 
    </head>
    <body>
        <div class="registration-container">
            <img src="Foods.jpg" alt="APU Cafeteria" class="registration-logo">
            <h1>Customer Registration</h1>  
            <div class="tab">
                <button class="tablinks" onclick="location.href='login.jsp'">Back to Login Page</button>
                <button class="tablinks" onclick="location.href='customersregister.jsp'">Customer Registration</button>
                <button class="tablinks" onclick="location.href='LoadStallstaffRegister'">Stall Staff Registration</button>
                <button class="tablinks active">Stall Staff Registration</button>
            </div>  
            <form action="RegisterStall" method="POST" class="registration-form">
                <input type="text" name="stallName" placeholder="STALL NAME:" required>
                <input type="text" name="category" placeholder="CATEGORY" required>
                
                <div class="form-actions">
                    <input type="submit" value="Register Stall" class="btn-register">
                </div>
            </form>
            <% if (request.getAttribute("fail") != null) { %>
            <p style="color: red;"><%= request.getAttribute("fail") %></p>
            <% } %>
        </div>
    </body>
</html>

