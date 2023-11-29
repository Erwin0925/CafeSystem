<%-- 
    Document   : managecustomer
    Created on : Nov 29, 2023, 1:16:53 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Customers</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <h1>Customer Details</h1>
        <a href="managershome.jsp" class="back-button">Back</a><br><br>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Gender</th>
            </tr>
            <c:forEach var="customer" items="${cusProf}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.username}</td>
                    <td>${customer.email}</td>
                    <td>${customer.hp}</td>
                    <td>${customer.address}</td>
                    <td>${customer.gender}</td>
                </tr>
            </c:forEach>
        </table>
        <br><hr>
        
        <h2>Customer Search</h2>
        <form action="CustomerSearch" method="post">
            <label>Customer Username:</label>
            <select name="cusUsername1" id="stallUsername">
                <c:forEach items="${allcustomer}" var="usernameObject">
                    <option value="${usernameObject.username}">${usernameObject.username}</option>
                </c:forEach>
            </select><br><br>

            <input type="submit" value="Search">
        </form>
        <c:choose>
            <c:when test="${managerFound}">
                <!-- Display the table if manager is found -->
                <br><br>
                <table border="1">
                    <tr>
                        <th>StaffId</th>                
                        <th>Username</th>
                        <th>Password</th>
                        <th>Status</th>
                        <th>Role</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>HP</th>
                        <th>Gender</th>
                    </tr>
                    <tr>
                        <td>${cusdetails.id}</td>
                        <td>${cusdetails.username}</td>
                        <td>${userdetails.password}</td>
                        <td>${userdetails.status}</td>
                        <td>${userdetails.role}</td>
                        <td>${cusdetails.address}</td>
                        <td>${cusdetails.email}</td>
                        <td>${cusdetails.hp}</td>
                        <td>${cusdetails.gender}</td>
                    </tr>
                </table>
            </c:when>
            <c:otherwise>
                <% if (request.getAttribute("fail2") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("fail2") %></p>
                <% } %>
            </c:otherwise>
        </c:choose>
        <br><hr>
        
        <h2>Customer Deletion</h2>
        <form action="CustomerDelete" method="post">
            <label>Customer Username:</label>
            <select name="cusUsername2" id="stallUsername">
                <c:forEach items="${allcustomer}" var="usernameObject">
                    <option value="${usernameObject.username}">${usernameObject.username}</option>
                </c:forEach>
            </select><br><br>

            <input type="submit" value="Delete">
        </form>
        <br><hr>

        <h2>Customer Update</h2>
        <form action="CustomerUpdate" method="post">
            <label>Customer Username:</label>
            <select name="cusUsername3" id="stallUsername">
                <c:forEach items="${allcustomer}" var="usernameObject">
                    <option value="${usernameObject.username}">${usernameObject.username}</option>
                </c:forEach>
            </select><br><br>

            Password: <input type="password" name="password"><br><br>
            Address: <input type="text" name="address"><br><br>
            Email: <input type="email" name="email"><br><br>
            HP: <input type="text" name="hp"><br><br>
            Gender:
                <input type="radio" id="male" name="gender" value="Male">
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label><br><br>

            <input type="submit" value="Change">
        </form>
        <% if (request.getAttribute("done3") != null) { %>
            <p style="color: green;"><%= request.getAttribute("done3") %></p>
        <% } %>
        <br><hr>
        
    </body>
</html>
