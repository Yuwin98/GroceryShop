<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Article" %>
<%@ page import="Model.HomeCard" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Super Mart</title>

    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/store.svg"  type="image/svg+xml">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">

    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400&family=Roboto:wght@400;700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;800&display=swap" rel="stylesheet">
</head>
<body>

<jsp:include page="../header.jsp"/>


<%@ include file="../nav.jsp" %>

<div class="main-container">
    <main>
        <div class="hero">
            <img src="${pageContext.request.contextPath}/images/hero.jpg" alt="Hero image">
        </div>

        <div class="articles">

            <%
                List<Article> articleLst = (ArrayList<Article>) request.getAttribute("cards");

                for(Article article : articleLst) {
                    String title = article.getTitle();
                    String shortDescription  = article.getShortDescription();
                    String path = request.getContextPath() + "/images/" +  article.getPath();


            %>

            <div class="article-card">
                <img class="article-image" src="<%=path%>" alt="<%=title%>">
                <div class="article-content">
                    <div class="article-title"><%=title%></div>
                    <p class="article-details">
                       <%=shortDescription%>
                    </p>
                    <a class="article-button" href="#"><h3>Read more</h3></a>
                </div>
            </div>

            <% } %>

        </div>

        <div class="featured">

            <div class="new-arrivals">
                <h3 class="featured-title">New <span class="featured-title-bold">Arrivals</span></h3>

                <div class="featured-cards">
                    <%
                        Map<String,List<HomeCard>> cardMap = (Map<String, List<HomeCard>>) request.getAttribute("homeCards");
                        List<HomeCard> arrivalCards = cardMap.get("new");

                        for(HomeCard card : arrivalCards){

                            String name = card.getName();
                            String price = card.getPrice();
                            String path = request.getContextPath() + "/images/" + card.getPath();

                    %>
                    <div class="featured-card">
                        <img src="<%=path%>" alt="" class="featured-card-img">
                        <div class="featured-card-content">
                            <h2 class="featured-content-title"><%=name%></h2>
                            <h3 class="featured-content-price"><span class="per-unit">Per 1 unit(s)</span><br>Rs.<%=price%></h3>
                        </div>
                    </div>

                    <% } %>
                </div>
            </div>

            <div class="best-sellers">
                <h3 class="featured-title">Best <span class="featured-title-bold">Sellers</span></h3>
                <div class="featured-cards">
                    <%

                        List<HomeCard> bestCards = cardMap.get("best");

                        for(HomeCard card : bestCards){

                            String name = card.getName();
                            String price = card.getPrice();
                            String path = request.getContextPath() + "/images/" + card.getPath();

                    %>
                    <div class="featured-card">
                        <img src="<%=path%>" alt="" class="featured-card-img">
                        <div class="featured-card-content">
                            <h2 class="featured-content-title"><%=name%></h2>
                            <h3 class="featured-content-price"><span class="per-unit">Per 1 unit(s)</span><br>Rs.<%=price%></h3>
                        </div>
                    </div>

                    <% } %>
                </div>
            </div>

            <div class="our-promotions">
                <h3 class="featured-title">Our <span class="featured-title-bold">Promotions</span></h3>
                <div class="featured-cards">
                    <%

                        List<HomeCard> promoCards = cardMap.get("promo");

                        for(HomeCard card : promoCards){

                            String name = card.getName();
                            String price = card.getPrice();
                            String path = request.getContextPath() + "/images/" + card.getPath();

                    %>
                    <div class="featured-card">
                        <img src="<%=path%>" alt="" class="featured-card-img">
                        <div class="featured-card-content">
                            <h2 class="featured-content-title"><%=name%></h2>
                            <h3 class="featured-content-price"><span class="per-unit">Per 1 unit(s)</span><br>Rs.<%=price%></h3>
                        </div>
                    </div>

                    <% } %>
                </div>
            </div>



        </div>
        
        <div class="promo-ads">

            <%
                List<String> promos = (List<String>)request.getAttribute("promos");

                for(String promo : promos){

                    String path = request.getContextPath() + "/images/" + promo;

            %>
            <div class="promos">
                <img src="<%=path%>" alt="Promo Ad">
            </div>

            <% } %>

        </div>

       

    </main>




</div>



</body>
</html>
