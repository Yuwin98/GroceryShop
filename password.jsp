<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 8/3/2020
  Time: 3:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Registration.Register" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Conection.DBconnection" %>
<html>
<head>
    <title>Password</title>
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="css/pass.css" rel="stylesheet" type="text/css">
    <link href="fontawesome-free-5.12.1-web/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    Map<String, String> errors = new HashMap<String, String>();
    Register R1 = new Register();
    String FName = request.getParameter("FirstName");
    String LName = request.getParameter("LastName");
    String Email = request.getParameter("Email");
    String Username = request.getParameter("Username");
    String Contactnumber = request.getParameter("ContactNumber");
    String Address = request.getParameter("Address");
    R1.setLName(FName);
    R1.setLName(LName);
    R1.setEmail(Email);
    R1.setUsername(Username);
    R1.setContactnumber(Contactnumber);
    R1.setAddress(Address);
    if(R1.validationuser())
    {
        errors.put("EmailOrUsername", "error");
        errors.put("Other", "success");
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }


%>
<div class="container">
    <form action="/RegisterServlet" method="post">
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
                <input type="password" class="form-control" name="Password " placeholder="Password">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 text-lg-right">
                <label class="Label">Confirm Password : </label>
            </div>
            <div class="col-lg-6">
                <input type="password" class="form-control" name="CPassword " placeholder="Confirm Password">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-lg-center">
                <button type="submit" class="btn btn-outline-success btn-lg">Register</button>
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
