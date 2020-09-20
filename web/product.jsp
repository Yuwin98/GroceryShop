<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Yuwin
  Date: 9/20/2020
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>

    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/store.svg"  type="image/svg+xml">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400&family=Roboto:wght@400;700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;800&display=swap" rel="stylesheet">

</head>
<body>

<%

    Product product = (Product) request.getAttribute("product");
    String path = request.getContextPath() + "/images/" + product.getPath();
    String name = product.getName();
    String price = product.getPrice();
    String type = product.getType().substring(0,1).toUpperCase() + product.getType().substring(1) ;

%>

<div class="product-container">
        <div class="product-image">
            <img src="<%=path%>" alt="Product image" class="product-page-image">
        </div>
        <div class="product-description">
            <div class="product-details">
                <h1><%=name%></h1>
                <div class="border-details"></div>
                <h3>Rs.<%=price%></h3>
                <h4>Per 100g / 1 unit(s) <br><br>Category:<%=type%></h4>
                <div class="border-details"></div>
            </div>
            <div class="product-actions">
                <a href="#">Add to cart</a>
            </div>
        </div>
        <div class="related-products">
            <h3 class="related-title">Related <span class="featured-title-bold">Products</span></h3>
            <div class="related-products-items">
                <div class="featured-cards">

                    <%
                        List<Product> productList = (List<Product>) request.getAttribute("productList");

                        for(Product p: productList) {
                            String cardImagePath = request.getContextPath() + "/images/" + p.getPath();
                            String cardName = p.getName();
                            String cardPrice = p.getPrice();
                            int id = p.getId();
                    %>
                    <a href="product-page?id=<%=id%>" class="fc-link">
                        <div class="featured-card">
                            <img src="<%=cardImagePath%>" alt="" class="featured-card-img">
                            <div class="featured-card-content">
                                <h2 class="featured-content-title"><%=cardName%></h2>
                                <h3 class="featured-content-price"><span class="per-unit">Per 100g / 1 unit(s)</span><br>Rs.<%=cardPrice%></h3>
                            </div>
                        </div>
                    </a>

                    <% } %>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
