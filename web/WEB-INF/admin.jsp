<%-- 
    Document   : admin
    Created on : 28-Jul-2022, 9:19:33 PM
    Author     : patel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Home Inventory</h1>
        <ul>
            <li><a href="inventory">Inventory</a></li>
            <li><a href="admin">Admin</a></li>
            <li><a href="login?logout">Logout</a></li>
        </ul>
        <h3>Manage Users</h3>
        <table>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>
                       ${user.getUsername()}
                    </td>
                    
                    <td>
                         ${user.getFirstName()}
                    </td>
                    <td>
                        ${user.getLastName()}
                    </td>
                    
                    
                    <td>
                    <form method="post" action="admin">
                         <input type="hidden" name="action" value="delete">
                         <input type="hidden" name="username" value="${user.getUsername()}">
                         <input type="submit" value="Delete">
                    </form>
                    <td>
                        
                   <td>
                    <form method="post" action="admin">
                         <input type="hidden" name="action" value="view">
                         <input type="hidden" name="username" value="${user.getUsername()}">
                         <input type="submit" value="Edit">
                    </form>
                    <td>
                </tr>
            </c:forEach>
        </table>
    <h3>Add User</h3>
    <c:if test="${selectedUser eq null}">
    <form method="post" action="admin">
        <label>Username: </label>
        <input type="text" name="username" value="">
        <br>
        <label>Password: </label>
        <input type="text" name="password" value="">
        <br>
        <label>Email: </label>
        <input type="text" name="email" value="">
        <br>
        <label>First Name </label>
        <input type="text" name="firstName" value="">
        <br>
        <label>Last Name: </label>
        <input type="text" name="lastName" value="">
        <br>
        <input type="hidden" name="action" value="create">
        <input type="submit" value="Save">
    </form>
    </c:if>
    <c:if test="${selectedUser ne null}">
    <form method="post" action="admin">
        <label>Username: </label>
        <input type="text" name="username" value="${selectedUser.getUsername()}">
        <br>
        <label>Password: </label>
        <input type="text" name="password" value="${selectedUser.getPassword()}">
        <br>
        <label>Email: </label>
        <input type="text" name="email" value="${selectedUser.getEmail()}">
        <br>
        <label>First Name </label>
        <input type="text" name="firstName" value="${selectedUser.getFirstName()}">
        <br>
        <label>Last Name: </label>
        <input type="text" name="lastName" value="${selectedUser.getLastName()}">
        <br>
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="oldUsername" value="${selectedUser.getUsername()}">
        <input type="submit" value="Update">
    </form>
    </c:if>
    <p>${error}</p>
    </body>
</html>

