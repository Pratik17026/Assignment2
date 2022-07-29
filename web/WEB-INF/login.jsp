<%-- 
    Document   : login
    Created on : 28-Jul-2022, 9:20:07 PM
    Author     : patel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Home Inventory</h1>
        <h3>Login</h3>
        <form method="post" action="">
            <label>User name:</label>
            <input type="text" name="username" value=""><br>
            <label>Password:</label>
            <input type="password" name="password" value=""><br>
            <input type="submit" value="Submit">
        </form>
        <p>${message}</p>
    </body>
</html>

