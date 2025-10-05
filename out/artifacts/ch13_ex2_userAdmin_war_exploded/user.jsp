<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Update User</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>Update User</h1>
<p style="color: #555;">You can update the user's first and last name, but the email is read-only.</p>

<form action="userAdmin" method="post" style="margin-top:1em;">
    <input type="hidden" name="action" value="update_user">
    <input type="hidden" name="email" value="${user.email}">

    <label>Email:</label>
    <input type="text" value="${user.email}" readonly><br>

    <label>First Name:</label>
    <input type="text" name="firstName" value="${user.firstName}" required><br>

    <label>Last Name:</label>
    <input type="text" name="lastName" value="${user.lastName}" required><br>

    <div style="margin-top: 1em;">
        <input type="submit" value="💾 Update" class="margin_left">
        <a href="userAdmin?action=display_users"
           style="margin-left: 1em; text-decoration: none; color: #007b7f;">⬅ Back to list</a>
    </div>
</form>

</body>
</html>
