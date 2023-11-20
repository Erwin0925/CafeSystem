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
    </head>
    <body>
        <h1>Login</h1>
        <br><br>
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
        </form>
        <br><br><br>
        <a href="customersregister.jsp">New Customer Registration</a> 
        <br><br>
        <a href="stallstaffsregister.jsp">New Stall Staff Registration</a>
    </body>
</html>
