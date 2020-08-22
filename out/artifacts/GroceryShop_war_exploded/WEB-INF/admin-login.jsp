<%--
  Created by IntelliJ IDEA.
  User: PRIYANTHA
  Date: 8/2/2020
  Time: 6:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC&family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
<body>
    <div class="login">
        <h3 class="login-heading">Login to access dashboard</h3>
        <div class="admin-login">
            <form class="admin-login-form" action="auth-admin" method="post">
                <input class="login-input" type="text" name="name" placeholder="Username">
                <input class="login-input" type="password" name="password" placeholder="Password">
                <input class="login-submit" type="submit" value="Submit">
            </form>
        </div>
    </div>
</body>
</html>
