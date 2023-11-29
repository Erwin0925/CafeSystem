<%-- 
    Document   : SellingReport
    Created on : Nov 29, 2023, 7:31:56 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Stall Staff Report</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css">
</head>
    <body>
        <a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>
        <h1>Business Report</h1>
        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Day Sold</th>
                <th>Total Earn</th>
            </tr>
            <c:forEach var="row" items="${reportData}">
                <tr>
                    <td><c:out value="${row[0]}" /></td>
                    <td><fmt:formatDate value="${row[1]}" pattern="yyyy-MM-dd" /></td>
                    <td><c:out value="RM${row[2]}" /></td>
                </tr>
            </c:forEach>
        </table>
        <h3>Total Earning = RM${reportDataTotal}</h3>
        <form action="BusinessReport" method="get">
            <select name="reportType">
                <option value="today">Today</option>
                <option value="weekly">Weekly</option>
                <option value="monthly">Monthly</option>
            </select>
            <input type="submit" value="Show Report">
        </form>
    </body>
</html>
