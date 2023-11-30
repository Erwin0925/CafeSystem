<%-- 
    Document   : login
    Created on : Nov 19, 2023, 10:40:38 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APU Cafeteria System - Login</title>
        <link rel="stylesheet" type="text/css" href="login.css">
    </head>
    <body>
        <div class="login-container">
            <img src="Foods.jpg" alt="APU Cafeteria" class="login-logo">
            <h1 class="login-title">APU CAFETERIA SYSTEM</h1>
            <div class="login-form">
                <form action="Login" method="POST">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn-login">LOGIN</button><br><br>
                        <a href="customersregister.jsp" class="btn-register">REGISTER</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
