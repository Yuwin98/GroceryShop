<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 8/3/2020
  Time: 3:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/pass.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Password</title>
</head>
<body>

<div class="container">
    <form action="register-pass" method="post">
        <div class="row top">
            <div class="col-lg-12">
                <label class="register">set password</label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Password : </label>
            </div>
            <div class="col-lg-6">
                <input type="password" class="form-control" name="Password" placeholder="Password">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Confirm Password : </label>
            </div>
            <div class="col-lg-6">
                <input type="password" class="form-control" name="CPassword" placeholder="Confirm Password">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-lg-center">
                <button type="submit" class="btn btn-outline-success btn-lg">Register</button>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


</body>
</html>
