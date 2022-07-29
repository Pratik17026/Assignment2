<%-- 
    Document   : newjspinventory
    Created on : 28-Jul-2022, 9:20:00 PM
    Author     : patel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Page</title>
    </head>
    <body>
        <h1>Home Inventory for ${username}</h1>
        <ul>
            <li><a href="inventory">Inventory</a></li>
            <li><a href="admin">Admin</a></li>
            <li><a href="login?logout">Logout</a></li>
        </ul>
        
        <h3>Inventory for ${firstName} ${lastName}</h3>
        <table>
            <tr>
                <th>Category</th>
                <th>Name</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>
                       ${item.getCategory().getCategoryName()}
                    </td>
                    
                    <td>
                         ${item.getItemName()}
                    </td>
                    <td>
                        $${item.getPrice()}
                    </td>
                    
                    <td>
                    <form method="post" action="inventory">
                         <input type="hidden" name="action" value="delete">
                         <input type="hidden" name="itemId" value="${item.getItemID()}">
                         <input type="submit" value="Delete">
                    </form>
                    <td>
                </tr>
            </c:forEach>
        </table>
        
        <h3>Add Item</h3>
        <form method="post">
        <label>Category</label>
        <select name="room">
            <option value="3">living room</option>
            <option value="5">bedroom</option>
            <option value="6">garage</option>
            <option value="1">kitchen</option>
            <option value="2">bathroom</option>
            <option value="4">basement</option>
            <option value="7">office</option>
            <option value="8">utility room</option>
            <option value="9">storage</option>
            <option value="10">other</option>
        </select>
        <br>
        <label>Item Name: </label>
        <input type="text" name="item" value="">
        <br>
        <label>Price: </label>
        <input type="text" name="price" value="">
        <br>
        <input type="hidden" name="action" value="create">
        <input type="submit" value="Add">
        <span>${errorMsg}</span>
        </form>
        <p>${message}</p>
    </body>
</html>

