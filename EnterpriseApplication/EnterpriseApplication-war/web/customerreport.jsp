<%-- 
    Document   : customerreport
    Created on : Nov 29, 2023, 6:29:02 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Report</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="managershome.jsp" class="back-button">Back</a><br><br>
        <h1>Customer Report</h1>
        <p>Total Customers: ${totalCustomer}</p>

        <!-- Gender Distribution -->
        <h2>Gender Distribution</h2>
        <table border="1">
            <tr>
                <th>Gender</th>
                <th>Count</th>
            </tr>
            <c:forEach items="${genderDistribution}" var="entry">
                <tr>
                    <td>${entry[0]}</td>
                    <td>${entry[1]}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- State Distribution -->
        <h2>State Distribution</h2>
        <table border="1">
            <tr>
                <th>State</th>
                <th>Count</th>
            </tr>
            <c:forEach items="${addressDistribution}" var="entry">
                <tr>
                    <td>${entry[0]}</td>
                    <td>${entry[1]}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
