<%-- 
    Document   : customerviewmenu
    Created on : Nov 28, 2023, 2:10:18 AM
    Author     : Erwin_Yoga
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Menu</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
</head>
    <body>
        <a href="customershome.jsp" class="back-button">Back</a><br><br>
        <h2>Select a Stall</h2>
        <form action="LoadCustomerMenu" method="get">
            <select name="stallname" onchange="this.form.submit()">
                <option value="">Select a Stall</option>
                <c:forEach var="stall" items="${stallList}">
                    <c:set var="isSelected" value="${stall.stallname == param.stallname}" />
                    <option value="${stall.stallname}" ${isSelected ? 'selected' : ''}>${stall.stallname}</option>
                </c:forEach>
            </select>
        </form>

        <h2>Menu Items</h2>          
        <table border="1">
            <tr>
                <th>Menu ID</th>
                <th>Item Name</th>
                <th>Price</th>
                <th>Status</th>
            </tr>
            <c:forEach var="menu" items="${menuList}">
                <tr>
                    <td>${menu.id}</td>
                    <td>${menu.price}</td>
                    <td>${menu.modifyby}</td>
                    <td>${menu.status}</td>
                </tr>
            </c:forEach>
        </table>
        
        <h3>Make Order</h3>
        <form action ="AddToCart" method ="post">
            <label>Menu ID:</label>
            <input type="text" name="menuId" ><br><br>
            <input type="submit" value="Add to Cart">
        </form>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <p style="color: green;"><%= request.getAttribute("successMessage") %></p>
        <% } %>
        
        <h3>Delete Cart Item</h3>
        <form action ="DeletetoCart" method ="post">
            <label>Menu ID:</label>
            <input type="text" name="cartId" ><br><br>
            <input type="submit" value="Remove From Cart">
        </form>
    </body>
    <h3>My Cart</h3>
    <table border="1">
        <thead>
            <tr>
            <th>Cart ID</th>
            <th>Menu ID</th>
            <th>Item Name</th>
            <th>Price</th>
        </tr>
        <c:forEach var="carts" items="${carts}">
            <tr>
                <td>${carts.id}</td>
                <td>${carts.menuid}</td>
                <td>${carts.itemname}</td>
                <td>${carts.price}</td>
            </tr>
        </c:forEach>
    </table>
    
    <form action="LoadPayment" method="post">
        <br><input type="submit" value="Proceed to Payment" />
    </form>   
</html>
