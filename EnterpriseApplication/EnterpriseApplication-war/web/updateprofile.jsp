<%-- 
    Document   : editprofile
    Created on : Nov 26, 2023, 1:47:35 PM
    Author     : Erwin_Yoga
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <%
    String password = (String) session.getAttribute("pw");
    String address = (String) session.getAttribute("address");
    String hp = (String) session.getAttribute("hp");
    String email = (String) session.getAttribute("email");
    String gender = (String) session.getAttribute("gender");
    %>
    <body>

    <h2>Edit Profile</h2>
    <table border="1">
    <tr>
        <th>Original Password</th>
        <th>Original Email</th>
        <th>Original Address</th>
        <th>Original Phone Number</th>
        <th>Original Gender</th>
    </tr>
    <tr>
        <td><%= password %></td>
        <td><%= email %></td>
        <td><%= address %></td>
        <td><%= hp %></td>
        <td><%= gender %></td>
    </tr>
</table>

    <!-- Assuming you have a servlet that handles the update profile request -->
    <form action="UpdateProfile" method="POST">
        <br><br>
        <table>
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
            <tr>
                <td>Gender: </td>
                <td>
                    <input type="radio" id="male" name="gender" value="Male">
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label>
                </td>
            </tr>
        </table>
        <p><input type="submit" value="Comfirm Update"></p>
    </form>

    </body>
</html>

