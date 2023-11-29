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
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="managershome.jsp" class="back-button">Back</a><br><br>
        <h1>Stalls Feedback and Rating</h1>
        <form action="AnalysisDetails" method="post">
            <table border="1">
                <tr>
                    <th>Select</th>
                    <th>Stall</th>
                    <th>Average Rating</th>
                </tr>
                <c:forEach items="${stallRatings}" var="stall">
                    <tr>
                        <td><input type="radio" name="selectedStall" value="${stall.key}"></td>
                        <td>${stall.key}</td>
                        <td>${stall.value}</td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <input type="submit" value="Show Feedback">
        </form>

        <c:if test="${not empty orderdtl}">
            <h2>Feedback for Selected Stall</h2>
            <table border="1">
                <tr>
                    <th>Order Id</th>
                    <th>Rating</th>
                    <th>Feedback</th>
                </tr>
                <c:forEach items="${orderdtl}" var="feedback">
                    <tr>
                        <td>${feedback.id}</td>
                        <c:choose>
                            <c:when test="${feedback.status == 'empty'}">
                                <td>User not yet fill</td>
                                <td>User not yet fill</td>
                            </c:when>
                            <c:when test="${feedback.status == 'filled'}">
                                <td>${feedback.rating}</td>
                                <td>${feedback.feedback}</td>
                            </c:when>
                            <c:otherwise>
                                <td>Unknown status</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
