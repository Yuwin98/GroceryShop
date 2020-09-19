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
  <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
  <link href="css/Style_Login.css" rel="stylesheet" type="text/css">
  <link href="fontawesome-free-5.12.1-web/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
  <form action="password.jsp" method="post" name="Pdata">
    <div class="row top">
      <div class="col-lg-12">
        <label class="register">Employee registration</label>
      </div>
    </div>
    <div class="row top">
      <div class="col-lg-2 text-lg-right">
        <label class="Label">First Name : </label>
      </div>
      <div class="col-lg-4 vali ${errors.Other} ">
        <input type="text" class="form-control" name="FirstName" placeholder="First Name" value="${param.FirstName}" required>
        <i class="fas fa-check-circle"></i>
        <i class="fas fa-exclamation-circle"></i>
      </div>
      <div class="col-lg-2 text-lg-right">
        <label class="Label">Last Name : </label>
      </div>
      <div class="col-lg-4 vali ${errors.Other} ">
        <input type="text" class="form-control" name="LastName" placeholder="Last Name" value="${param.LastName}" required>
        <i class="fas fa-check-circle"></i>
        <i class="fas fa-exclamation-circle"></i>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 text-lg-right">
        <label class="Label">Email : </label>
      </div>
      <div class="col-lg-6 vali ${errors.EmailOrUsername} ">
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
      <div class="col-lg-6 vali ${errors.EmailOrUsername} ">
        <input type="text" class="form-control" name="Username" placeholder="Username" value="${param.Username}" required>
        <i class="fas fa-check-circle"></i>
        <i class="fas fa-exclamation-circle"></i>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 text-lg-right">
        <label class="Label">Contact Number : </label>
      </div>
      <div class="col-lg-6 vali  ${errors.Other}">
        <input type="text" class="form-control" name="ContactNumber" placeholder="Contact Number" value="${param.ContactNumber}" required>
        <i class="fas fa-check-circle"></i>
        <i class="fas fa-exclamation-circle"></i>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 text-lg-right">
        <label class="Label">Address : </label>
      </div>
      <div class="col-lg-6 vali  ${errors.Other}">
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/popper.min.js"></script>
<script src="js/bootstrap-4.0.0.js"></script>
</body>
</html>
