<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 7/16/2020
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form action="register" method="post" name="Pdata">
        <div class="row top">
            <div class="col-lg-12">
                <label class="register">User registration</label>
            </div>
        </div>
        <div class="row top">
            <div class="col-lg-2 text-lg-right">
                <label class="Label">First Name : </label>
            </div>
            <div class="col-lg-4 vali ">
                <input type="text" class="form-control" name="FirstName" placeholder="First Name" value="${param.FirstName}" required>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="col-lg-2 text-lg-right">
                <label class="Label">Last Name : </label>
            </div>
            <div class="col-lg-4 vali">
                <input type="text" class="form-control" name="LastName" placeholder="Last Name" value="${param.LastName}" required>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Email : </label>
            </div>
            <div class="col-lg-6 vali  ">
                <input type="email" class="form-control" name="Email" placeholder="Email" value="${param.Email}" required>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small style="color: red; margin-top: .5rem">nic number or email address already in our database</small>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Username : </label>
            </div>
            <div class="col-lg-6 vali ">
                <input type="text" class="form-control" name="Username" placeholder="Username" value="${param.Username}" required>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Contact Number : </label>
            </div>
            <div class="col-lg-6 vali  ">
                <input type="text" class="form-control" name="ContactNumber" placeholder="Contact Number" value="${param.ContactNumber}" required>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Address : </label>
            </div>
            <div class="col-lg-6 vali ">
                <textarea type="text" class="form-control" name="Address" placeholder="Address" required>${param.Address}</textarea>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-lg-center">
                <button type="submit" class="btn btn-outline-success btn-lg">Next <i class="fas fa-forward"></i></button>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
