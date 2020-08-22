<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%

        String title = (String) request.getAttribute("pagename");
        title = title.substring(0,1).toUpperCase() + title.substring(1);
    %>
    <title>Pages |<%=" " + title%></title>

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



        <h3 class="cards-heading"><%=title %></h3>
        <div class="cards">

            <%
                List<Product> products = (ArrayList<Product>) request.getAttribute("items");
                String search = request.getAttribute("search") == null ? "": (String) request.getAttribute("search");

                for(Product p : products){
                    String name = p.getName();
                    String price = p.getPrice();
                    boolean inCart = p.isInCart();
                    int id = p.getId();
                    String type = p.getType();
                    String path = request.getContextPath() + "/images/" + p.getPath();
            %>

                <div class="card">
                    <a href="#" class="card-link">
                    <img src="<%= path%>" alt="<%= name%>">
                    <h3 class="card-title"><%=name%></h3>
                    <div class="options">
                        <p class="card-price">Rs<%=price%></p>
                        <div class="card-action">
                            <% if(!inCart){  %>
                            <a href="addcart?type=<%=type%>&id=<%=id%>&search=<%=search%>" class="add-cart">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="18px"
                                     height="18px">
                                    <path d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
                                </svg>
                            </a>
                            <% }else { %>
                            <a href="removecart?type=<%=type%>&id=<%=id%>&search=<%=search%>" class="remove-cart">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="18px" height="18px">
                                    <path d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
                                </svg>
                            </a>
                            <% } %>
                        </div>
                    </div>
                    </a>
                </div>



            <% }%>



        </div>

    </main>

    <%
        int pages = (int) request.getAttribute("totalpages");
        int currentPage = (int) request.getAttribute("currentpage");
        int init = 1;
        String type = (String) request.getAttribute("type");
        if(pages > 3 && request.getAttribute("type") != null){
            init = currentPage >= 3 ? currentPage - 1: init;

            init = currentPage == pages ? currentPage - 2 : init;
    %>

        <div class="pagination">
            <% for(int i = init; i <= init+2 && i <= pages; i++){  %>
                <div class="pag-num <%= currentPage == i ? " selected":""%>"><a href="pages?type=<%=type%>&page=<%=i%>" class="pag-link"><%=i%></a></div>
            <% } %>
            <% if(currentPage < pages-1){ %>
                <span class="pag-ellipsis">.....</span>
                <div class="pag-num "><a href="pages?type=<%=type%>&page=<%=pages%>" class="pag-link"><%=pages%></a></div>
            <% } %>

        </div>

        <% } else if(request.getAttribute("type") != null)  { %>

        <div class="pagination">
            <% for(int i = 1; i <= pages; i++){  %>
                <div class="pag-num <%= currentPage == i ? " selected":""%>"><a href="pages?type=<%=type%>&page=<%=i%>" class="pag-link"><%=i%></a></div>
            <% } %>
    </div>

    <% } %>
</div>


</body>
</html>
