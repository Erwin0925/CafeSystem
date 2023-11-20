<%-- 
    Document   : stallstaffsregister
    Created on : Nov 20, 2023, 9:02:18 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stall Staff Registration Page</title>
    </head>
    <body>
        <h1>Stall Staff Registration</h1>
        <br><br>
        <form action="StallStaffsRegister" method="Post">
            <table>
                <!-- Stall staff specific registration fields -->
                <tr>
                    <td>Username: </td><td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="password" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Email: </td><td><input type="text" name="email" size="20"></td>
                </tr>
                <tr>
                    <td>Phone Number: </td><td><input type="text" name="phone" size="20"></td>
                </tr>
                <tr>
                    <td>Origin State: </td><td><input type="text" name="address" size="20"></td>
                </tr>
                <!-- Additional fields specific to stall staff can be added here -->
            </table>
            <p><input type="submit" value="Register"></p>
        </form>
        <br><br><br>
        <a href="customersregister.jsp">Customer Registration Page</a>
        <br><br>
        <a href="login.jsp">Login Page</a>
    </body>
</html>
