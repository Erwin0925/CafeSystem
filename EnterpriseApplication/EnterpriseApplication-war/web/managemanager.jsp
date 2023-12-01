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
        <title>Manage Manager</title>
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
            <a class="dashboard-link">Manage Manager</a>
            <a href="LoadManageStallstaff" class="dashboard-link">Manage Stall Staff</a>
            <a href="LoadManageCustomer" class="dashboard-link">Customer Management</a>
            <a href="LoadRatingFeedback" class="dashboard-link">Feedback Analysis</a>
            <a href="LoadManagerReport" class="dashboard-link">Manager Information Report</a>
            <a href="LoadStallstaffReport" class="dashboard-link">Stallstaff Information Report</a>
            <a href="LoadCustomerReport" class="dashboard-link">Customer Information Report</a>
            <a href="LoadStallReport" class="dashboard-link">Stall Information Report</a>
            <a href="LoadStallEarningReport" class="dashboard-link">Stall Selling Report</a>
        </nav>
    
        <main class="dashboard-content">
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
                Username: <input type="text" name="username" required>
                Password: <input type="password" name="password"required>
                Origin State:<select name="address" required>
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
                Email: <input type="email" name="email"required>
                HP: <input type="text" name="hp"required>
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
            <% if (request.getAttribute("success") != null) { %>
                <p style="color: green;"><%= request.getAttribute("done") %></p>
            <% } %>
            
            <hr>
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

            <hr>
            <!-- Delete Manager Form -->
            <h3>Delete Manager</h3>
            <form action="DeleteManager" method="post">
                ManagerId: <input type="text" name="managerId">
                <input type="submit" value="Delete Manager">
            </form>
            <% if (request.getAttribute("done2") != null) { %>
                <p style="color: green;"><%= request.getAttribute("done2") %></p>
            <% } %>

            <hr>
            <!-- Update Manager Form -->
            <h3>Update Manager Profile</h3>
            <form action="UpdateManagerProfile" method="post">
                Username of Manager to Update: <input type="text" name="username">
                Password: <input type="password" name="password">
                Origin State:<select name="address" required>
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
                Email: <input type="email" name="email">
                HP: <input type="text" name="hp">
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
        </main>   
        
        <footer class="dashboard-footer">
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
            
    </body>
</html>
