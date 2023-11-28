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
        </table><br><br>
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
        
        <br><br><hr>
        <!-- Search Manager Form -->
        <h3>Search Manager</h3>
        <form action="SearchManager" method="get">
            Username: <input type="text" name="username"><br><br>
            <input type="submit" value="Search Manager">
        </form>
        <c:choose>
            <c:when test="${managerFound}">
                <!-- Display the table if manager is found -->
                <br><br>
                <table border="1">
                    <tr>
                        <th>ManagerId</th>                
                        <th>Username</th>
                        <th>Password</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>HP</th>
                        <th>Gender</th>
                    </tr>
                    <tr>
                        <td>${managerProf.id}</td>
                        <td>${managerProf.username}</td>
                        <td>${userProf.password}</td>
                        <td>${managerProf.address}</td>
                        <td>${managerProf.email}</td>
                        <td>${managerProf.hp}</td>
                        <td>${managerProf.gender}</td>
                    </tr>
                </table>
            </c:when>
            <c:otherwise>
                <% if (request.getAttribute("fail2") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("fail2") %></p>
                <% } %>
            </c:otherwise>
        </c:choose>        
        
        
        <br><br><hr>
        <!-- Delete Manager Form -->
        <h3>Delete Manager</h3>
        <form action="DeleteManager" method="post">
            ManagerId: <input type="text" name="managerId"><br><br>
            <input type="submit" value="Delete Manager">
        </form>
        <% if (request.getAttribute("done2") != null) { %>
            <p style="color: green;"><%= request.getAttribute("done2") %></p>
        <% } %>
        
        <br><br><hr>
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
                <input type="submit" value="Update Manager">
        </form>
        <% if (request.getAttribute("fail3") != null) { %>
            <p style="color: red;"><%= request.getAttribute("fail3") %></p>
        <% } %>
        <% if (request.getAttribute("done3") != null) { %>
            <p style="color: green;"><%= request.getAttribute("done3") %></p>
        <% } %>
        <br><br><br><br><br><br><br><br>

    </body>
</html>
