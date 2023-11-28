<%-- 
    Document   : managepayment
    Created on : Nov 28, 2023, 4:16:36 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>
    <body>
        <a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>
        <h1>Serch Customer Order</h1>
        <form action="ManagePayment" method="post">
            <label for="menuIdToDelete">Customer's username:</label>
            <input type="text" name="cusUsername" required>
            <input type="submit" value="Search">
        </form>
        
        <h3>Customer's Oder Details</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="orderdetailList" items="${orderdetailList}">
                <tr>
                    <td>${orderdetailList.name}</td>
                    <td>${orderdetailList.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <form action="ProcessPayment" method="post">
        <div>
            <h3>Total Amount: RM${totalAmount}</h3>
            <input type="hidden" name="totalAmount" value="${totalAmount}" />
            <p>Customer's Username: ${cusUsername}</p>
            <input type="hidden" name="cusUsername" value="${cusUsername}" />
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required><br><br>
        </div>
        <div>
            <label for="csv">CSV:</label>
            <input type="text" id="csv" name="csv" required><br><br>
        </div>
        <div>
            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required><br><br>
        </div>
        <div>
            <label for="holderName">Card Holder Name:</label>
            <input type="text" id="holderName" name="holderName" required><br><br>
        </div>
        <div>
            <input type="submit" value="Make Payment"><br><br>
        </div>
    </form>
        
    </body>
</html>
