<%-- 
    Document   : editprofile
    Created on : Nov 26, 2023, 1:47:35 PM
    Author     : Erwin_Yoga
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Dashboard</title>
        <link rel="stylesheet" type="text/css" href="customershome.css">
        <link rel="stylesheet" type="text/css" href="updateprofile.css">
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
            <a href="LoadCustomerMenu" class="dashboard-link">View Menu</a>
            <a href="LoadOrderHistory" class="dashboard-link">Order History</a>
        </nav>

        <main class="dashboard-content">
            <h2>Edit Profile</h2>
            <div class="original-info">
                <table class="info-table">
                    <tr>
                        <th>Original Password</th>
                        <th>Original Email</th>
                        <th>Original Address</th>
                        <th>Original Phone Number</th>
                        <th>Original Gender</th>
                    </tr>
                    <tr>
                        <td>${pw}</td>
                        <td>${email}</td>
                        <td>${address}</td>
                        <td>${hp}</td>
                        <td>${gender}</td>
                    </tr>
                </table>
            </div>

            <div class="update-form">
                <form action="UpdateProfile" method="POST">
                    <table class="edit-table">
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password" class="input-field" value="${password}"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" class="input-field" value="${email}"></td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td><input type="text" name="phone" class="input-field" value="${hp}"></td>
                        </tr>
                        <tr>
                            <td>Origin State:</td>
                            <td>
                                <select name="address" class="select-field" required>
                                    <option value="">Select a State</option>
                                        <option value="johor">Johor</option>
                                        <option value="kedah">Kedah</option>
                                        <option value="kelantan">Kelantan</option>
                                        <option value="kuala lumpur">Kuala Lumpur</option>
                                        <option value="labuan">Labuan</option>
                                        <option value="melaka">Melaka</option>
                                        <option value="negeri sembilan">Negeri Sembilan</option>
                                        <option value="pahang">Pahang</option>
                                        <option value="penang">Penang</option>
                                        <option value="perak">Perak</option>
                                        <option value="perlis">Perlis</option>
                                        <option value="putrajaya">Putrajaya</option>
                                        <option value="sabah">Sabah</option>
                                        <option value="sarawak">Sarawak</option>
                                        <option value="selangor">Selangor</option>
                                        <option value="terengganu">Terengganu</option>
                                        <option value="other">Other Country</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td>
                                <label class="gender-radio">
                                    <input type="radio" name="gender" value="Male" ${"Male".equalsIgnoreCase(gender) ? "checked" : ""}>
                                    Male
                                </label>
                                <label class="gender-radio">
                                    <input type="radio" name="gender" value="Female" ${"Female".equalsIgnoreCase(gender) ? "checked" : ""}>
                                    Female
                                </label>
                            </td>
                        </tr>
                    </table>
                    <div class="form-submit">
                        <input type="submit" value="Confirm Update" class="submit-button">
                    </div>
                </form>
            </div>
        </main>
                                    
        <footer class="dashboard-footer">
            <p>&copy; 2023 Food Service. All rights reserved.</p>
        </footer>
    </body>
</html>

