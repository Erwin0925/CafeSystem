<%-- 
    Document   : register
    Created on : Nov 19, 2023, 10:45:42 PM
    Author     : Erwin_Yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" type="text/css" href="cssstyle.css"> 
    </head>
    <body>
        <h1>Customer Registration</h1>  
        <br><br>
        <form action = "CustomersRegister" method = "Post">
            <div class="inline-button-group">
                <a href="customersregister.jsp" class="register-button-group button active">Customer Registration</a>
                <a href="LoadStallstaffRegister" class="register-button-group button inactive">Stall Staff Registration</a>
                <br><br><br>
            </div>
            <table>
                <tr>
                    <td>Username: </td><td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="text" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Email: </td><td><input type="text" name="email" size="20"></td>
                </tr>
                <tr>
                    <td>Phone Number: </td><td><input type="text" name="hp" size="20"></td>
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
                <a href="login.jsp"><input type="button" value="Login" class = "register-button-group"></a>
                <input type="submit" value="Register" class="register-button-group">
            </div>
        </form>
        <br><br><br>
        <br><br>
    </body>
</html>
