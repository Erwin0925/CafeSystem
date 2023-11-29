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
        <title>Stall and Staff Details</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
    <h1>Manage Stall & Stallstaff</h1>
    <a href="managershome.jsp" class="back-button">Back</a><br><br>
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
        <br><br><input type="submit" value="Select Stall">
    </form>

    <!-- This section is only displayed if a stall is selected -->
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
                    
                    <!-- other staff details -->
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
                        <!-- other staff details -->
                    </tr>
                </c:forEach>
            </table><br><br>
            <input type="submit" value="Select Staff">
        </form>
    </c:if>

    <!-- This section is only displayed if a staff member is selected -->
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
    
    <br><hr>
    <h2>Stall Approval</h2>
        <form action="StallApprove" method="post">
            <label for="stallname">Stall Name:</label>
            <select name="stallname" required>
                <c:forEach items="${stallNames}" var="name">
                    <option value="${name}">${name}</option>
                </c:forEach>
            </select><br><br>

            <label>Status:</label>
            <input type="radio" id="approved" name="status" value="Approved">
            <label for="approved">Approved</label>
            <input type="radio" id="pending" name="status" value="Pending">
            <label for="pending">Pending</label><br><br>

            <input type="submit" value="Submit">
        </form>
    <br><hr><br>
    
    
    </body>
</html>