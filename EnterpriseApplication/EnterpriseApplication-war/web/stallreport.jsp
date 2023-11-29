<%-- 
    Document   : stallreport
    Created on : Nov 29, 2023, 6:45:18 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
        <title>Stall Report</title>
    </head>
    <body>
        <h1>Stall Report</h1>
        <!-- Total Number of Stalls -->
        <p>Total Number of Stalls: ${totalStall}</p>

        <!-- Category Distribution -->
        <h2>Category Distribution</h2>
        <table border="1">
            <tr>
                <th>Category</th>
                <th>Count</th>
            </tr>
            <c:forEach items="${categoryDistribution}" var="entry">
                <tr>
                    <td>${entry[0]}</td>
                    <td>${entry[1]}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
