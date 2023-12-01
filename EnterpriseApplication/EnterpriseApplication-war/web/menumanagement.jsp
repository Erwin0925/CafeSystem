<%-- 
    Document   : menumanagement
    Created on : Nov 27, 2023, 2:00:15 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Stallstaff Dashboard</title>
    <link rel="stylesheet" type="text/css" href="stallstaffshome.css"> 
    <link rel="stylesheet" type="text/css" href="managemanager.css">
</head>
<body>
    <div id="dashboard-container">
        <div id="header">
            <h1>Stallstaff Dashboard</h1>
            <form id="logoutForm" action="Logout" method="POST">
                <input type="submit" value="Logout" id="logout-button">
            </form>
        </div>

        <div id="navigation">
            <a href="LoadProfile" class="nav-item">Edit Profile</a>
            <a href="LoadStallstaffMenu" class="nav-item">Menu Management</a>
            <a href="LoadManagePayment" class="nav-item">Manage Customer Payment</a>
            <a href="LoadViewStallstaffSales" class="nav-item">View Rating</a>
            <a href="LoadBusinessReport" class="nav-item">Business Report</a>
            <a href="LoadRatingFeedbackReport" class="nav-item">Rating and Feedback Report</a>
            <a href="LoadMenuSellingReport" class="nav-item">Menu Selling Report</a>
        </div>
        
        <main class="dashboard-content">
            <h2>Published Menus</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="menus" items="${menus}">
                        <tr>
                            <td>${menus.id}</td>
                            <td>${menus.itemname}</td>
                            <td>${menus.price}</td>
                            <td>${menus.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <hr>
            
            <h2>Add Menu</h2>
            <form action="AddMenu" method="post">
                <label for="menuName">Menu Name:</label>
                <input type="text" id="menuName" name="menuName" required>
                <label for="menuPrice">Menu Price:</label>
                <input type="text" id="menuPrice" name="menuPrice" required>
                <input type="submit" value="Add Menu">
            </form>
            <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
            
            <hr>
            
            <h2>Delete Menu</h2>
            <form action="DeleteMenu" method="post">
                <label for="menuIdToDelete">Menu ID to Delete:</label>
                <select id="menuIdToDelete" name="menuIdToDelete" required>
                    <c:forEach items="${menus}" var="menu">
                        <option value="${menu.id}">${menu.id}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Delete Menu">
            </form>
            
            <hr>
            
            <h2>Search Menu</h2>
            <form action="SearchMenu" method="post">
                <label for="menuNameToSearch">Menu Name to Search:</label>
                <select id="menuNameToSearch" name="menuNameToSearch" required>
                    <c:forEach items="${menus}" var="menu">
                        <option value="${menu.itemname}">${menu.itemname}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Search Menu">
            </form>
                <% 
                    if (request.getAttribute("errorMessage2") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("errorMessage2") %></p>
                <% } else if (request.getAttribute("searchResult") != null) { %>
                    <div id="searchResults">
                        <div>
                            <br>
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Item Name</th>
                                        <th>Price</th>
                                        <th>Modify by</th>
                                        <th>Stallname</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <tr>
                                            <td>${searchResult.id}</td>
                                            <td>${searchResult.itemname}</td>
                                            <td>${searchResult.price}</td>
                                            <td>${searchResult.modifyby}</td>
                                            <td>${searchResult.stallname}</td>
                                            <td>${searchResult.status}</td>
                                        </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <% } 
                %>     
                
            <hr>
            
            <h2>Update Menu</h2>
            <form action="UpdateMenu" method="post">
                <label for="menuIdToUpdate">Menu ID to Update:</label>             
                <select id="menuIdToUpdate" name="menuIdToUpdate" required>
                    <c:forEach items="${menus}" var="menu">
                        <option value="${menu.id}">${menu.id}</option>
                    </c:forEach>
                </select><br><br>
                <label for="updatedMenuName">Updated Menu Name:</label>
                <input type="text" id="updatedMenuName" name="updatedMenuName" required>
                <label for="updatedMenuPrice">Updated Menu Price:</label>
                <input type="text" id="updatedMenuPrice" name="updatedMenuPrice" required>
                <input type="submit" value="Update Menu">
            </form>
            
            <hr>
            
            <h2>Update Status</h2>
            <form action="UpdateMenuStatus" method="post">
                <label for="menuIdToUpdateStatus">Menu ID to Update Status:</label>
                <select id="menuIdToUpdateStatus" name="menuIdToUpdateStatus" required>
                    <c:forEach items="${menus}" var="menu">
                        <option value="${menu.id}">${menu.id}</option>
                    </c:forEach>
                </select><br><br>
                <label>Status:</label>
                <input type="radio" id="inStock" name="status" value="In Stock" required>
                <label for="inStock">In Stock</label>
                <input type="radio" id="outOfStock" name="status" value="Out Of Stock" required>
                <label for="outOfStock">Out of Stock</label><br><br>
                <input type="submit" value="Update Status">
            </form>
            
        </main>
                
        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>
</body>
</html>

