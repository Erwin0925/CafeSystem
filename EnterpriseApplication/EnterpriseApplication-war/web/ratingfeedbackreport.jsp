<%-- 
    Document   : ratingfeedbackreport
    Created on : Nov 29, 2023, 9:06:10 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Rating Feedback Report</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>
        <h1>Rating Feedback Report</h1>

        <h3>Average Score: ${averageScore}</h3>

        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Feedback</th>
                <th>Rating</th>
            </tr>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <c:choose>
                        <c:when test="${order.status == 'filled'}">
                            <td>${order.feedback}</td>
                            <td>${order.rating}</td>
                        </c:when>
                        <c:when test="${order.status == 'empty'}">
                            <td>User not yet fill</td>
                            <td>User not yet fill</td>
                        </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>