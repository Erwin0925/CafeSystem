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
        <title>Manage Customer</title>
        <link rel="stylesheet" type="text/css" href="managershome.css">
        <link rel="stylesheet" type="text/css" href="managemanager.css">
    </head>
    <body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <h1>Manager Dashboard</h1>
            <form action="Logout" method="Post" class="logout-form">
                <input type="submit" value="Logout" class="logout-button">
            </form>
        </header>

        <nav class="dashboard-nav">
            <a href="LoadManageManager" class="dashboard-link">Manage Manager</a>
            <a href="LoadManageStallstaff" class="dashboard-link">Manage Stall Staff</a>
            <a class="dashboard-link">Customer Management</a>
            <a href="LoadRatingFeedback" class="dashboard-link">Feedback Analysis</a>
            <a href="LoadManagerReport" class="dashboard-link">Manager Information Report</a>
            <a href="LoadStallstaffReport" class="dashboard-link">Stallstaff Information Report</a>
            <a href="LoadCustomerReport" class="dashboard-link">Customer Information Report</a>
            <a href="LoadStallReport" class="dashboard-link">Stall Information Report</a>
            <a href="LoadStallEarningReport" class="dashboard-link">Stall Selling Report</a>
        </nav>

        <main class="dashboard-content">
            <h1>Customer Details</h1>
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
            
            <hr>

            <h2>Customer Search</h2>
            <form action="CustomerSearch" method="post">
                <label>Customer Username:</label>
                <select name="cusUsername1" id="stallUsername" required>
                    <c:forEach items="${allcustomer}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Search">
            </form>
            <c:choose>
                <c:when test="${managerFound}">
                    <!-- Display the table if manager is found -->
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
            
            <hr>

            <h2>Customer Deletion</h2>
            <form action="CustomerDelete" method="post">
                <label>Customer Username:</label>
                <select name="cusUsername2" id="stallUsername" required>
                    <c:forEach items="${allcustomer}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Delete">
            </form>
            
            <hr>

            <h2>Customer Update</h2>
            <form action="CustomerUpdate" method="post">
                <label>Customer Username:</label>
                <select name="cusUsername3" id="stallUsername" required>
                    <c:forEach items="${allcustomer}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select>
                Password: <input type="password" name="password" required>
                            Origin State:<select name="address" required required>
                                <option value="">Select a State</option>
                                <option value="johor">Johor</option>
                                <option value="kedah">Kedah</option>
                                <option value="kelantan">Kelantan</option>
                                <option value="kuala lumpur">Kuala Lumpur</option>
                                <option value="labuan">Labuan</option>
                                <option value="melaka">Melaka</option>
                                <option value="negeri sembilan">Negeri Sembilan</option>
                                <option value="pahang">Pahang</option>
                                <option value="penang">Penang</option>
                                <option value="perak">Perak</option>
                                <option value="perlis">Perlis</option>
                                <option value="putrajaya">Putrajaya</option>
                                <option value="sabah">Sabah</option>
                                <option value="sarawak">Sarawak</option>
                                <option value="selangor">Selangor</option>
                                <option value="terengganu">Terengganu</option>
                                <option value="other">Other Country</option>
                            </select>
                Email: <input type="email" name="email" required>
                HP: <input type="text" name="hp" required>
                Gender:
                    <input type="radio" id="male" name="gender" value="Male" required>
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label><br><br>

                <input type="submit" value="Change">
            </form>
            <% if (request.getAttribute("done3") != null) { %>
                <p style="color: green;"><%= request.getAttribute("done3") %></p>
            <% } %>
            <% if (request.getAttribute("fail3") != null) { %>
                <p style="color: red;"><%= request.getAttribute("fail3") %></p>
            <% } %>
        </main>
    </body>
</html>
