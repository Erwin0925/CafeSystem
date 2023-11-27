<%-- 
    Document   : menumanagement
    Created on : Nov 27, 2023, 2:00:15 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu Management</title>
    <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
</head>
<body>
    <h1>Menu Management</h1>

    <!-- Add Menu Form -->
    <!-- ... (previous code for adding, deleting, searching, and updating menus) ... -->

    <!-- Display Published Menus Table -->
    <h2>Published Menus</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <!-- Replace 'publishedMenus' with the list of already published menus from your database -->
            <c:forEach var="menu" items="${publishedMenus}">
                <tr>
                    <td>${menu.menuId}</td>
                    <td>${menu.itemName}</td>
                    <td>${menu.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h2>Add Menu</h2>
    <form action="AddMenuServlet" method="post">
        <label for="menuName">Menu Name:</label>
        <input type="text" id="menuName" name="menuName" required><br><br>
        <label for="menuPrice">Menu Price:</label>
        <input type="text" id="menuPrice" name="menuPrice" required><br><br>
        <input type="submit" value="Add Menu">
    </form>

    <!-- Delete Menu Form -->
    <h2>Delete Menu</h2>
    <form action="DeleteMenuServlet" method="post">
        <label for="menuIdToDelete">Menu ID to Delete:</label>
        <input type="text" id="menuIdToDelete" name="menuIdToDelete" required><br><br>
        <input type="submit" value="Delete Menu">
    </form>

    <!-- Search Menu Form -->
    <h2>Search Menu</h2>
    <form action="SearchMenuServlet" method="post">
        <label for="menuNameToSearch">Menu Name to Search:</label>
        <input type="text" id="menuNameToSearch" name="menuNameToSearch" required><br><br>
        <input type="submit" value="Search Menu">
    </form>

    <!-- Update Menu Form -->
    <h2>Update Menu</h2>
    <form action="UpdateMenuServlet" method="post">
        <label for="menuIdToUpdate">Menu ID to Update:</label>
        <input type="text" id="menuIdToUpdate" name="menuIdToUpdate" required><br><br>
        <label for="updatedMenuName">Updated Menu Name:</label>
        <input type="text" id="updatedMenuName" name="updatedMenuName" required><br><br>
        <label for="updatedMenuPrice">Updated Menu Price:</label>
        <input type="text" id="updatedMenuPrice" name="updatedMenuPrice" required><br><br>
        <input type="submit" value="Update Menu">
    </form>
    
    <h2>Update Status</h2>
    <form action="UpdateMenuStatusServlet" method="post">
        <label for="menuIdToUpdateStatus">Menu ID to Update Status:</label>
        <input type="text" id="menuIdToUpdateStatus" name="menuIdToUpdateStatus" required><br><br>
        <label>Status:</label>
        <input type="radio" id="inStock" name="status" value="inStock" required>
        <label for="inStock">In Stock</label>
        <input type="radio" id="outOfStock" name="status" value="outOfStock" required>
        <label for="outOfStock">Out of Stock</label><br><br>
        <input type="submit" value="Update Status">
    </form>
</body>
</html>

