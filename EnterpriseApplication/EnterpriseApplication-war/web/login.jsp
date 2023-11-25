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
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <h1>Login</h1>
        <br>
        <form action = "Login" method = "Post">
            <table>
                <tr>
                    <td>Username: </td><td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="text" name="password" size="20"></td>
                </tr>
            </table>
            <p><input type="submit" value="Login"></p>
            <br><br>
            <div class="inline-button-group">
                <a href="customersregister.jsp" class="register-button-group button inactive">Customer Registration</a>
                <a href="stallstaffsregister.jsp" class="register-button-group button inactive">Stall Staff Registration</a>
                <br><br><br>
            </div>
            
        </form>
    </body>
</html>
