<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>User Management</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>User Management</h1>

<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th colspan="2" style="text-align:center;">Actions</th>
    </tr>

    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td class="right">
                <a href="userAdmin?action=display_user&amp;email=${user.email}">✏️ Update</a>
            </td>
            <td class="right">
                <a href="userAdmin?action=delete_user&amp;email=${user.email}"
                   onclick="return confirm('Are you sure you want to delete this user?');">🗑 Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<p style="margin-top:1em;">
    <a href="userAdmin?action=display_users">🔄 Refresh</a>
</p>

</body>
</html>
