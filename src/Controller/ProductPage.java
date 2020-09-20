package Controller;

import DB.ProductManager;
import Model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductPage",urlPatterns = "/product-page")
public class ProductPage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String origin = request.getParameter("o") != null ? request.getParameter("o"):"";
        ProductManager manager = new ProductManager();
        Product product;
        List<Product> productList;
        if(origin.equals("")) {
             product = manager.getProduct(id,"product");
             productList = manager.getRelatedProductList(product.getId(), 5, product.getType(), "product");
        }else {
            product = manager.getProduct(id,"common");
             productList = manager.getRelatedProductList(product.getId());
        }
        request.setAttribute("productList",productList);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product.jsp").forward(request,response);

    }
}
