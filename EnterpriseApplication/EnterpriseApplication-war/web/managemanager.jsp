<%-- 
    Document   : managemanager
    Created on : Nov 28, 2023, 11:13:20 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Managers</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <h1>Manage Manager</h1>
        <a href="managershome.jsp" class="back-button">Back</a><br><br>
        <h2>Manager List</h2>
        <table border="1">
            <tr>
                <th>ManagerId</th>                
                <th>Username</th>
                <th>Address</th>
                <th>Email</th>
                <th>HP</th>
                <th>Gender</th>
            </tr>
            <c:forEach items="${managers}" var="manager">
                <tr>
                    <td>${manager.id}</td>
                    <td>${manager.username}</td>
                    <td>${manager.address}</td>
                    <td>${manager.email}</td>
                    <td>${manager.hp}</td>
                    <td>${manager.gender}</td>
                </tr>
            </c:forEach>
        </table>
        <hr>
        <!-- Add Manager Form -->
        <h3>Add Manager</h3>
        <form action="AddManager" method="post">
            Username: <input type="text" name="username" required><br><br>
            Password: <input type="password" name="password"required><br><br>
            Address: <input type="text" name="address"required><br><br>
            Email: <input type="email" name="email"required><br><br>
            HP: <input type="text" name="hp"required><br><br>
            Gender:
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label><br><br>
            <input type="submit" value="Add Manager">
        </form>
        <% if (request.getAttribute("fail") != null) { %>
            <p style="color: red;"><%= request.getAttribute("fail") %></p>
        <% } %>
        <% if (request.getAttribute("done") != null) { %>
            <p style="color: green;"><%= request.getAttribute("done") %></p>
        <% } %>
        
        <hr>
        <!-- Delete Manager Form -->
        <h3>Delete Manager</h3>
        <form action="DeleteManager" method="post">
            Username: <input type="text" name="username"><br><br>
            <input type="submit" value="Delete Manager">
        </form>
        <hr>
        <!-- Search Manager Form -->
        <h3>Search Manager</h3>
        <form action="SearchManager" method="get">
            Username: <input type="text" name="username"><br><br>
            <input type="submit" value="Search Manager">
        </form>
        <hr>
        <!-- Update Manager Form -->
        <h3>Update Manager Profile</h3>
        <form action="UpdateManagerProfile" method="post">
            Username of Manager to Update: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            Address: <input type="text" name="address"><br><br>
            Email: <input type="email" name="email"><br><br>
            HP: <input type="text" name="hp"><br><br>
            Gender:
                <input type="radio" id="male" name="gender" value="Male">
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label><br><br>
                <input type="submit" value="Update Manager"><br><br><br><br><br><br><br><br>
        </form>

    </body>
</html>
