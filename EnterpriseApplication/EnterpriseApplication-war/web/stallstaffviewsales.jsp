<%-- 
    Document   : stallstaffviewsales
    Created on : Nov 28, 2023, 10:25:00 PM
    Author     : Erwin_Yoga
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css">
</head>
<body>
<h2>Individual Sales Records & Ratings of : ${userName}</h2>
<a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>

<table class="table-2 order-list-table order-list-table">
    <tr>
        <th>Order ID</th>
        <th>Date</th>
        <th>Total Price</th>
        <th>Rating</th>
    </tr>
    <c:forEach items="${orderprof}" var="order">
        <tr>
            <td>${order.id}</td>
            <td>${order.mydate}</td>
            <td>RM${order.totalprice}</td>
        <c:choose>
            <c:when test="${order.status == 'empty'}">
                <td>User not yet filled</td>
            </c:when>
            <c:when test="${order.status == 'filled'}">
                <td>${order.rating}</td>
            </c:when>
            <c:otherwise>
                <td>Unknown status</td>
            </c:otherwise>
        </c:choose>
        </tr>
    </c:forEach>
</table>

</body>
</html>
