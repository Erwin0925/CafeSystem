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
        <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
    </head>
    <body>
        <h1>Stall Staff Registration</h1>
        <br><br>
        <form action="StallStaffsRegister" method="Post">
            <div class="inline-button-group ">
                <a href="customersregister.jsp" class="register-button-group button inactive">Customer Registration</a>
                <a href="stallstaffsregister.jsp" class="register-button-group button active">Stall Staff Registration</a>
                <br><br><br>
            </div>
            <br><a href="stallsregister.jsp" class="register-button-group button inactive">Stall Registration</a>
            <table>
                <br><br>
                <tr>
                    <td>Select Stall:</td>
                    <td>
                        <select name="stallname" required>
                            <c:forEach items="${stallNames}" var="name">
                                <option value="${name}">${name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Username: </td><td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="password" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Email: </td><td><input type="text" name="email" size="20"></td>
                </tr>
                <tr>
                    <td>Phone Number: </td><td><input type="text" name="phone" size="20"></td>
                </tr>
                <tr>
                    <td>Origin State: </td>
                    <td>
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
                    </td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <input type="radio" id="male" name="gender" value="Male">
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female">
                        <label for="female">Female</label>
                    </td>
                </tr> 
            </table>
            <div class="inline-button-group">
                <br><br><br>
                <a href="login.jsp"><input type="button" value="Login" class="register-button-group"></a>
                <input type="submit" value="Register" class="register-button-group">
            </div>
        </form> 
    </body>
</html>
