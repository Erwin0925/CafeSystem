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
    </body>
</html>
