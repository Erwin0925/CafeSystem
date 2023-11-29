<%-- 
    Document   : ratingfeedbackanalysis
    Created on : Nov 29, 2023, 2:43:31 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Stall Feedback</title>
    </head>
    <body>
        <h1>Stalls Feedback and Rating</h1>
        <form action="YourServletURL" method="post">
            <table border="1">
                <tr>
                    <th>Select</th>
                    <th>Stall</th>
                    <th>Average Rating</th>
                </tr>
                <c:forEach items="${stalls}" var="stall">
                    <tr>
                        <td><input type="radio" name="selectedStall" value="${stall.id}"></td>
                        <td>${stall.name}</td>
                        <td>${stall.averageRating}</td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <input type="submit" value="Show Feedback">
        </form>

        <c:if test="${not empty feedbackList}">
            <h2>Feedback for Selected Stall</h2>
            <table>
                <tr>
                    <th>Customer</th>
                    <th>Rating</th>
                    <th>Comment</th>
                </tr>
                <c:forEach items="${feedbackList}" var="feedback">
                    <tr>
                        <td>${feedback.customerName}</td>
                        <td>${feedback.rating}</td>
                        <td>${feedback.comment}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
