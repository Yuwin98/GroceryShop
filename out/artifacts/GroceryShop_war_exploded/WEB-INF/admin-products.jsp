<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">

    <title>Admin | Products</title>
</head>
<body>
<jsp:include page="admin-nav.jsp"/>
<div class="user-container">


    <%

        List<Product> productList = (List<Product>) request.getAttribute("productlist");


    %>
    <table class="table-users">
        <thead >
        <tr class="table-user-heading">
            <th colspan="6">PRODUCT TABLE</th>
            <th colspan="3">
                <div>
                    <a href="add-user">ADD PRODUCT</a>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="20px" height="20px">
                        <path d="M0 0h24v24H0z" fill="none"/>
                        <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
                    </svg>
                </div>
            </th>
        </tr>
        <tr class="table-user-titles">
            <th>IMG</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>PATH</th>
            <th>DESCRIPTION</th>
            <th>TYPE</th>
            <th>ACTIONS</th>
        </tr>
        </thead>
        <tbody class="table-product-body">
        <%
            for(Product p: productList) {

        %>
        <tr class="user-data">
            <td><img class="product-image" width="60" height="60" src="${pageContext.request.contextPath}/images/<%=p.getPath()%>"></td>
            <td><%=p.getId()%></td>
            <td><%=p.getName()%></td>
            <td>R.s <%=p.getPrice()%></td>
            <td><%=p.getPath()%></td>
            <td><%=p.getDescription()%></td>
            <td><%=p.getType()%></td>
            <td class="table-users-actions">
                <div class="user-action">
                    <a href="update-product?productid=">
                        <svg width="18px" fill="#2c3e50"  height="18px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 383.947 383.947" style="enable-background:new 0 0 383.947 383.947;" xml:space="preserve">
<g>
    <g>
        <g>
            <polygon points="0,303.947 0,383.947 80,383.947 316.053,147.893 236.053,67.893 			"/>
            <path d="M377.707,56.053L327.893,6.24c-8.32-8.32-21.867-8.32-30.187,0l-39.04,39.04l80,80l39.04-39.04
				C386.027,77.92,386.027,64.373,377.707,56.053z"/>
        </g>
    </g>
</g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
</svg>
                    </a>
                    <a href="delete-product?productid=">
                        <svg height="18px" viewBox="-40 0 427 427.00131" width="18px" fill="#e74c3c" xmlns="http://www.w3.org/2000/svg"><path d="m232.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0"/><path d="m114.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0"/><path d="m28.398438 127.121094v246.378906c0 14.5625 5.339843 28.238281 14.667968 38.050781 9.285156 9.839844 22.207032 15.425781 35.730469 15.449219h189.203125c13.527344-.023438 26.449219-5.609375 35.730469-15.449219 9.328125-9.8125 14.667969-23.488281 14.667969-38.050781v-246.378906c18.542968-4.921875 30.558593-22.835938 28.078124-41.863282-2.484374-19.023437-18.691406-33.253906-37.878906-33.257812h-51.199218v-12.5c.058593-10.511719-4.097657-20.605469-11.539063-28.03125-7.441406-7.421875-17.550781-11.5546875-28.0625-11.46875h-88.796875c-10.511719-.0859375-20.621094 4.046875-28.0625 11.46875-7.441406 7.425781-11.597656 17.519531-11.539062 28.03125v12.5h-51.199219c-19.1875.003906-35.394531 14.234375-37.878907 33.257812-2.480468 19.027344 9.535157 36.941407 28.078126 41.863282zm239.601562 279.878906h-189.203125c-17.097656 0-30.398437-14.6875-30.398437-33.5v-245.5h250v245.5c0 18.8125-13.300782 33.5-30.398438 33.5zm-158.601562-367.5c-.066407-5.207031 1.980468-10.21875 5.675781-13.894531 3.691406-3.675781 8.714843-5.695313 13.925781-5.605469h88.796875c5.210937-.089844 10.234375 1.929688 13.925781 5.605469 3.695313 3.671875 5.742188 8.6875 5.675782 13.894531v12.5h-128zm-71.199219 32.5h270.398437c9.941406 0 18 8.058594 18 18s-8.058594 18-18 18h-270.398437c-9.941407 0-18-8.058594-18-18s8.058593-18 18-18zm0 0"/><path d="m173.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0"/></svg>
                    </a>
                </div>
            </td>
        </tr>

        <% } %>

        </tbody>
    </table>

</div>

</body>
</html>
