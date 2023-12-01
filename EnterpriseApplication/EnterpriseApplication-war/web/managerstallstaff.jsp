<%-- 
    Document   : managerstallstaff
    Created on : Nov 29, 2023, 9:13:04 AM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manager Dashboard</title>
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
            <a class="dashboard-link">Manage Stall Staff</a>
            <a href="LoadManageCustomer" class="dashboard-link">Customer Management</a>
            <a href="LoadRatingFeedback" class="dashboard-link">Feedback Analysis</a>
            <a href="LoadManagerReport" class="dashboard-link">Manager Information Report</a>
            <a href="LoadStallstaffReport" class="dashboard-link">Stallstaff Information Report</a>
            <a href="LoadCustomerReport" class="dashboard-link">Customer Information Report</a>
            <a href="LoadStallReport" class="dashboard-link">Stall Information Report</a>
            <a href="LoadStallEarningReport" class="dashboard-link">Stall Selling Report</a>
        </nav>

        <main class="dashboard-content">
            <h2>Stall Details</h2>
            <form action="SelectStall" method="post">
                <table border="1">
                    <tr>
                        <th>Select</th>
                        <th>Stall Name</th>
                        <th>Category</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach items="${stallList}" var="stall">
                        <tr>
                            <td><input type="radio" name="selectedStall" value="${stall.stallname}"></td>
                            <td>${stall.stallname}</td>
                            <td>${stall.category}</td>
                            <td>${stall.status}</td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="Select Stall">
            </form>

            <c:if test="${not empty ssProf2}">
                <h2>Stall Staff Details</h2>
                <form action="SelectUser" method="post">
                    <table border="1">
                        <tr>
                            <th>Select</th>
                            <th>Staff ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Hp</th>
                            <th>Origin</th>
                            <th>Gender</th>
                            <th>Work in</th>
                        </tr>
                        <c:forEach items="${ssProf2}" var="staff">
                            <tr>
                                <td><input type="radio" name="selectedStaff" value="${staff.username}"></td>
                                <td>${staff.id}</td>
                                <td>${staff.username}</td>
                                <td>${staff.email}</td>
                                <td>${staff.hp}</td>
                                <td>${staff.address}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.stallname}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <input type="submit" value="Select Staff">
                </form>
            </c:if>
              
            <c:if test="${not empty userProf}">
                <h2>User Details</h2>
                <table border="1">
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Status</th>
                    </tr>
                    <tr>
                        <td>${userProf.username}</td>
                        <td>${userProf.password}</td>
                        <td>${userProf.role}</td>
                        <td>${userProf.status}</td>
                    </tr>
                </table>
            </c:if>

            <hr>
            
            <h2>Stall Approval</h2>
            <form action="StallApprove" method="post">
                <label for="stallname">Stall Name:</label>
                <select name="stallname" required>
                    <c:forEach items="${stallNames}" var="name">
                        <option value="${name}">${name}</option>
                    </c:forEach>
                </select>

                <label>Status:</label>
                <input type="radio" id="approved" name="status" value="approved" required>
                <label for="approved">Approved</label>
                <input type="radio" id="pending" name="status" value="pending">
                <label for="pending">Pending</label><br><br>
                <input type="submit" value="Submit">
            </form>
            
            <hr>

            <h2>Stallstaff Approval</h2>
            <form action="StallstaffApprove" method="post">
                <label for="stallUsername">Stall Username:</label>
                <select name="stallUsername" id="stallUsername" required>
                    <c:forEach items="${allstallstaff}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select>
                <label>Status:</label>
                <input type="radio" id="approved" name="status2" value="approved" required>
                <label for="approved">Approved</label>
                <input type="radio" id="pending" name="status2" value="pending">
                <label for="pending">Pending</label><br><br>
                <input type="submit" value="Submit">
            </form>
            
            <hr>

            <h2>Stallstaff Deletion</h2>
            <form action="StallstaffDelete" method="post">
                <label for="stallUsername">Stall Username:</label>
                <select name="stallUsername2" id="stallUsername" required>
                    <c:forEach items="${allstallstaff}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select><br>
                <input type="submit" value="Delete">
            </form>
            
            <hr>

            <h2>Stallstaff Search</h2>
            <form action="StallStaffSearch" method="post">
                <label for="stallUsername">Stall Username:</label>
                <select name="stallUsername3" id="stallUsername" required>
                    <c:forEach items="${allstallstaff}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Search">
            </form>
            <c:choose>
                <c:when test="${managerFound}">
                    <br><br>
                    <table border="1">
                        <tr>
                            <th>StaffId</th>                
                            <th>Username</th>
                            <th>Password</th>
                            <th>Status</th>
                            <th>Role</th>
                            <th>Working in</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>HP</th>
                            <th>Gender</th>
                        </tr>
                        <tr>
                            <td>${ssdetails.id}</td>
                            <td>${ssdetails.username}</td>
                            <td>${userdetails2.password}</td>
                            <td>${userdetails2.status}</td>
                            <td>${userdetails2.role}</td>
                            <td>${ssdetails.stallname}</td>
                            <td>${ssdetails.address}</td>
                            <td>${ssdetails.email}</td>
                            <td>${ssdetails.hp}</td>
                            <td>${ssdetails.gender}</td>
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

            <h2>Stallstaff Update</h2>
            <form action="StallstaffUpdate" method="post">
                <label for="stallUsername">Stall Username:</label>
                <select name="stallUsername4" id="stallUsername" required>
                    <c:forEach items="${allstallstaff}" var="usernameObject">
                        <option value="${usernameObject.username}">${usernameObject.username}</option>
                    </c:forEach>
                </select><br>
                Password: <input type="password" name="password" required><br><br>
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
                            </select><br><br>
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
        <footer class="dashboard-footer">
            <p>&copy; 2023 Manager Dashboard. All rights reserved.</p>
        </footer>
    </body>
</html>