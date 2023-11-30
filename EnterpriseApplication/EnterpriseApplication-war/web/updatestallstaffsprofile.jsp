<%-- 
    Document   : editprofile
    Created on : Nov 26, 2023, 1:47:35 PM
    Author     : Erwin_Yoga
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css">
    </head>


    <body>

        <h2>Edit Profile</h2>
 
        <a href="stallstaffshome.jsp" class="back-button">Back</a><br><br>
        <table border="1">
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

        <form action="UpdateProfile" method="POST">
            <br><br>
            <table>
                <tr>
                    <td>Password: </td><td><input type="password" name="password" size="20" value=${password}></td>
                </tr>
                <tr>
                    <td>Email: </td><td><input type="text" name="email" size="20" value=${email}></td>
                </tr>
                <tr>
                    <td>Phone Number: </td><td><input type="text" name="phone" size="20" value=${hp}></td>
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
                        <input type="radio" id="male" name="gender" value="Male" <%= "Male".equalsIgnoreCase("${gender}") ? "checked" : "" %>>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female" <%= "Female".equalsIgnoreCase("${gender}") ? "checked" : "" %>>
                        <label for="female">Female</label>
                    </td>
                </tr>
            </table>
            <p><input type="submit" value="Comfirm Update"></p>
        </form>
    </body>
</html>

