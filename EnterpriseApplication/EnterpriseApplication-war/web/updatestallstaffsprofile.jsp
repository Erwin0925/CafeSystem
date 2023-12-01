<%-- 
    Document   : editprofile
    Created on : Nov 26, 2023, 1:47:35 PM
    Author     : Erwin_Yoga
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Stallstaff Dashboard</title>
    <link rel="stylesheet" type="text/css" href="stallstaffshome.css"> 
    <link rel="stylesheet" type="text/css" href="updateprofile.css">
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
                            <td><input type="password" name="password" class="input-field" value="${password}" required></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" class="input-field" value="${email}" required></td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td><input type="text" name="phone" class="input-field" value="${hp}" required></td>
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
                                    <input type="radio" name="gender" value="Male" ${"Male".equalsIgnoreCase(gender) ? "checked" : ""} required>
                                    Male
                                </label>
                                <label class="gender-radio">
                                    <input type="radio" name="gender" value="Female" ${"Female".equalsIgnoreCase(gender) ? "checked" : ""} required>
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
            <% if (request.getAttribute("error") != null) { %>
            <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
            <% if (request.getAttribute("success") != null) { %>
            <p style="color: green;"><%= request.getAttribute("success") %></p>
            <% } %>   
            
        </main>
            
        <footer class="dashboard-footer">
            <p>&copy; 2023 Stallstaff Dashboard. All rights reserved.</p>
        </footer>    
            
    </body>
</html>

