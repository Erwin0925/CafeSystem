<%-- 
    Document   : stallearningreport
    Created on : Nov 29, 2023, 6:57:57 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total item sold by a Store</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="managershome.jsp" class="back-button">Back</a><br><br>
        <h1>Total item sold by a Store</h1>
        <h2>Stall Order Counts</h2>
        <table border="1">
            <tr>
                <th>Stall Name</th>
                <th>Times got visited</th>
            </tr>
            <c:forEach items="${stallOrderCounts}" var="entry">
                <tr>
                    <td>${entry[0]}</td>
                    <td>${entry[1]}</td>
                </tr>
            </c:forEach>
        </table><br><br>
        <form action="EarningsReportServlet" method="post">
            <select name="timeFrame">
                <option value="today">Today</option>
                <option value="week">In a Week</option>
                <option value="month">In a Month</option>
            </select>
            <input type="submit" value="Show Report">
        </form>
    </body>
</html>
