<%-- 
    Document   : menusellingreport
    Created on : Nov 29, 2023, 9:53:13 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu Selling Report</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
</head>
<body>
    <a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>
    <h1>Menu Selling Report</h1>

    <table border="1">
        <tr>
            <th>Menu ID</th>
            <th>Name</th>
            <th>Count</th>
        </tr>
        <c:forEach var="menuCount" items="${menuCounts}">
            <tr>
                <td>${menuCount[0]}</td>
                <td>${menuCount[1]}</td>
                <td>${menuCount[2]}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
