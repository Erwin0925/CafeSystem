<%-- 
    Document   : stallstaffsregister
    Created on : Nov 20, 2023, 9:02:18 PM
    Author     : Erwin_Yoga
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stall Staff Registration Page</title>
        <link rel="stylesheet" type="text/css" href="register.css"> 
    </head>
    <body>
        <div class="registration-container">
            <img src="Foods.jpg" alt="APU Cafeteria" class="registration-logo">
            <h1>Stall Staff Registration</h1>
            <div class="tab">
                <button class="tablinks" onclick="location.href='login.jsp'">Back to Login Page</button>
                <button class="tablinks" onclick="location.href='customersregister.jsp'">Customer Registration</button>
                <button class="tablinks active">Stall Staff Registration</button>
                <button class="tablinks" onclick="location.href='stallsregister.jsp'">Stall Registration</button>
            </div>
            <form action="StallStaffsRegister" method="POST" class="registration-form">
                <select name="stallname" required>
                    <c:forEach items="${stallNames}" var="name">
                        <option value="${name}">${name}</option>
                    </c:forEach>
                </select>
                <input type="text" name="username" placeholder="USERNAME:" required>
                <input type="password" name="password" placeholder="Password:" required>
                <input type="email" name="email" placeholder="Email:" required>
                <input type="text" name="phone" placeholder="Phone Number:" required>
                <select name="address" required>
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
                <div class="gender-inputs">
                    <input type="radio" id="male" name="gender" value="Male">
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label>
                </div>
                <div class="form-actions">
                    <input type="submit" value="Register" class="btn-register">
                </div>
            </form>
            <% if (request.getAttribute("fail") != null) { %>
            <p style="color: red;"><%= request.getAttribute("fail") %></p>
            <% } %>
            <% if (request.getAttribute("success") != null) { %>
                <p style="color: green;"><%= request.getAttribute("success") %></p>
            <% } %>
        </div>
    </body>
</html>
