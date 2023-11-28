<%-- 
    Document   : payment
    Created on : Nov 28, 2023, 1:57:29 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
</head>
<body>
    <a href="LoadCustomerMenu" class="back-button">Back</a><br><br>
    <h3>My Cart</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Cart ID</th>
                <th>Menu ID</th>
                <th>Item Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cartsList" items="${cartsList}">
                <tr>
                    <td>${cartsList.id}</td>
                    <td>${cartsList.menuid}</td>
                    <td>${cartsList.itemname}</td>
                    <td>${cartsList.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>Total Amount: ${totalAmount}</h3>



    <form action="processPayment" method="post">
        <div>
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>
        </div>
        <div>
            <label for="csv">CSV:</label>
            <input type="text" id="csv" name="csv" required>
        </div>
        <div>
            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
        </div>
        <div>
            <label for="holderName">Card Holder Name:</label>
            <input type="text" id="holderName" name="holderName" required>
        </div>
        <div>
            <input type="submit" value="Make Payment">
        </div>
    </form>

</body>
</html>
