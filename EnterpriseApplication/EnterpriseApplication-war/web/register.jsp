<%-- 
    Document   : register
    Created on : Nov 19, 2023, 10:45:42 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <a href="login.jsp">Login Page</a>
        <br><br><br>
        <form action = "Register" method = "Post">
            <table>
                <tr>
                    <td>Username: </td><td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="text" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Email: </td><td><input type="text" name="email" size="20"></td>
                </tr>
                                <tr>
                    <td>Phone Number: </td><td><input type="text" name="hp" size="20"></td>
                </tr>
                <tr>
                    <td>Origin State: </td><td><input type="text" name="address" size="20"></td>
                </tr>
            </table>
            <p><input type="submit" value="Register"></p>
        </form>
    </body>
</html>
