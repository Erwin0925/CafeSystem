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
        <title>Customer View Menu</title>
        <link rel="stylesheet" type="text/css" href="customershome.css">
        <link rel="stylesheet" type="text/css" href="customerviewmenu.css">
    </head>
    <body>
        <div class="dashboard-container">
            <header class="dashboard-header">
                <h1>Customer Dashboard</h1>
                <form action="Logout" method="Post" class="logout-form">
                    <input type="submit" value="Logout" class="logout-button">
                </form>
            </header>

            <nav class="dashboard-nav">
                <a href="LoadProfile" class="dashboard-link">View Profile</a>
                <a class="dashboard-link">View Menu</a>
                <a href="LoadOrderHistory" class="dashboard-link">Order History</a>
            </nav>

            <main class="dashboard-content">
        <div class="dashboard-wrapper">
            <div class="left-column">
                <section class="select-stall">
                    <h2>Select a Stall</h2>
                    <form action="LoadCustomerMenu" method="get" class="select-form">
                        <select name="stallname" onchange="this.form.submit()" class="select-dropdown">
                            <option value="">Select a Stall</option>
                            <c:forEach var="stall" items="${stallList}">
                                <c:set var="isSelected" value="${stall.stallname == param.stallname}" />
                                <option value="${stall.stallname}" ${isSelected ? 'selected' : ''}>${stall.stallname}</option>
                            </c:forEach>
                        </select>
                    </form>
                </section>

                <section class="menu-items">
                    <br><br>
                    <h2>Menu Items</h2>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Menu ID</th>
                                <th>Item Name</th>
                                <th>Price</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="menu" items="${menuList}">
                                <tr>
                                    <td>${menu.id}</td>
                                    <td>${menu.itemname}</td>
                                    <td>${menu.price}</td>
                                    <td>${menu.status}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </section>

                <section class="make-order">
                    <h3>Make Order</h3>
                    <form action="AddToCart" method="post" class="order-form">
                        <div class="form-group">
                            <label>Menu ID:</label>
                            <input type="text" name="menuId" class="input-text"><br><br>
                        </div>
                        <input type="submit" value="Add to Cart" class="submit-button">
                    </form>
                    <c:if test="${not empty errorMessage}">
                        <p class="error-message"><c:out value="${errorMessage}"/></p>
                    </c:if>
                    <c:if test="${not empty successMessage}">
                        <p class="success-message"><c:out value="${successMessage}"/></p>
                    </c:if>
                </section>
            </div>

            <div class="right-column">
                <section class="my-cart">
                    <h2>My Cart</h2>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Cart ID</th>
                                <th>Menu ID</th>
                                <th>Item Name</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="carts" items="${carts}">
                                <tr>
                                    <td>${carts.id}</td>
                                    <td>${carts.menuid}</td>
                                    <td>${carts.itemname}</td>
                                    <td>${carts.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </section>
                
                <section class="delete-cart-item">
                    <h3>Delete Cart Item</h3>
                    <form action="DeletetoCart" method="post" class="delete-form">
                        <div class="form-group">
                            <label for="cartId">Cart ID:</label>
                            <select id="cartId" name="cartId" class="select-dropdown">
                                <c:forEach items="${cartprof}" var="cart">
                                    <option value="${cart.id}">${cart.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="submit" value="Remove From Cart" class="submit-button">
                    </form>
                </section>

                <section class="order-actions">
                    <form action="CreateOrderDetails" method="post" class="create-order-form">
                        <input type="submit" value="Make Order" class="submit-button" />
                    </form> 
                    <c:if test="${not empty SM}">
                        <p class="success-message"><c:out value="${SM}"/></p>
                    </c:if>
                </section>
            </div>
        </div>
        </main>
        <footer class="dashboard-footer">
            <p>&copy; 2023 Food Service. All rights reserved.</p>
        </footer>
    </body>
</html>
