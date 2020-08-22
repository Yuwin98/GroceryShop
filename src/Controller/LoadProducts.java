package Controller;

import DB.CartManager;
import DB.DBConnection;
import Model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "LoadProducts",urlPatterns = "/page")
public class LoadProducts extends HttpServlet {

    Connection conn = DBConnection.getConnection();
    String page = "WEB-INF/pages.jsp";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        List<Product> productList = SearchItem(request);
        String searchTerm = request.getAttribute("searchterm") != null ? (String) request.getAttribute("searchterm") :"";

        if(searchTerm.isEmpty()){
            doGet(request,response);
            return;
        }

        int cartCount = LoadCartDetails(productList);
        request.setAttribute("type",request.getAttribute("type"));
        setRequestAttributes(request,response,productList,1,1,"Search",searchTerm,cartCount);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int limitPerPage = 16;
        int offset = 0;
        int pageNo;
        int totalPages = 1;
        String searchedTerm = request.getAttribute("search") == null ? "": (String) request.getAttribute("search");

        if(request.getAttribute("type") != ""  && searchedTerm.equals("") ){



                String type = (String) request.getAttribute("type");

                pageNo =  request.getAttribute("page") == null ? 1:(int)request.getAttribute("page");

                try {
                    PreparedStatement pstmt = conn.prepareStatement("Select count(id) as totalProducts from product where type = ?");
                    pstmt.setString(1,type);
                    ResultSet resultSet = pstmt.executeQuery();
                    while (resultSet.next()){
                        int totalProducts =  resultSet.getInt("totalProducts");
                        totalPages = (int) Math.ceil((double) totalProducts/limitPerPage);
                    }

                    if(pageNo == 0 || pageNo > totalPages){
                        return;
                    }
                    offset = (pageNo == 1 ? 0: ((pageNo-1)*limitPerPage));
                }catch (SQLException e) {
                    e.printStackTrace();
                }

            try {

                List<Product> productList =  QueryProducts(type,limitPerPage,offset);
                int cartCount = LoadCartDetails(productList);
                request.setAttribute("type",type);
                setRequestAttributes(request,response,productList,pageNo,totalPages,type,"",cartCount);


            }
            catch (SQLException e) {
                e.printStackTrace();
            }

        }else if(request.getAttribute("search") != "") {

            System.out.println("Here in get else");
            List<Product> productList =  SearchItem(request);
            int cartCount = LoadCartDetails(productList);
            setRequestAttributes(request,response,productList,1,1,"Search",searchedTerm,cartCount);

        }

    }

    public int LoadCartDetails(List<Product> productList){

        int count;
        List<Integer> cartList = new ArrayList<>();
        CartManager manager = new CartManager();

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select  * from cart where user_id = ?");
            pstmt.setInt(1, 1);
            ResultSet cartResult = pstmt.executeQuery();

            while (cartResult.next()) {
                int productId = cartResult.getInt("product_id");
                cartList.add(productId);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        for(Product product: productList) {
            if(cartList.contains(product.getId())) {
                product.setInCart(true);
            }
        }


        count = manager.getCartCount(1);
        return count;

    }

    private List<Product> SearchItem(HttpServletRequest request) {

        List<Product> productList = new ArrayList<>();
        if(request.getAttribute("searchterm") != "" || request.getAttribute("search") != "") {

            String searchTerm;

            if(request.getAttribute("searchterm") != null) {
                searchTerm = (String) request.getAttribute("searchterm");

            }else {
                searchTerm = (String) request.getAttribute("search");

            }

            try {

                PreparedStatement pstmt  = conn.prepareStatement("Select * from product where Lower(name) like ? ");
                pstmt.setString(1,'%' + searchTerm + '%');
                ResultSet resultSet = pstmt.executeQuery();

                while (resultSet.next()) {
                    Product product = new Product();
                    product.setName(resultSet.getString("name"));
                    product.setPrice(resultSet.getString("price"));
                    product.setPath(resultSet.getString("path"));
                    product.setId(resultSet.getInt("id"));
                    product.setType(resultSet.getString("type"));
                    productList.add(product);
                }

            }catch (SQLException e) {
                e.printStackTrace();
            }


        }
        return productList;
    }

    private List<Product> QueryProducts(String type,int limitPerPage,int offset) throws SQLException {
        List<Product> productList = new ArrayList<>();
        PreparedStatement pstmt = conn.prepareStatement("Select * from product where type = ? limit ? offset ?");
        pstmt.setString(1,type);
        pstmt.setInt(2,limitPerPage);
        pstmt.setInt(3,offset);

        ResultSet resultSet = pstmt.executeQuery();

        while (resultSet.next()) {
            Product product = new Product();
            product.setName(resultSet.getString("name"));
            product.setPrice(resultSet.getString("price"));
            product.setPath(resultSet.getString("path"));
            product.setId(resultSet.getInt("id"));
            product.setType(resultSet.getString("type"));
            productList.add(product);
        }

        return productList;
    }

    private  void setRequestAttributes(HttpServletRequest request, HttpServletResponse response, List<Product> productList, int currentPage, int totalPages, String pageName, String searchTerm, int cartLength) throws ServletException, IOException {
        request.setAttribute("items",productList);
        request.setAttribute("currentpage",currentPage);
        request.setAttribute("totalpages",totalPages);
        request.setAttribute("pagename",pageName);
        request.setAttribute("search",searchTerm);
        request.setAttribute("cartLength",cartLength);
        request.getRequestDispatcher(page).forward(request,response);
    }

}
