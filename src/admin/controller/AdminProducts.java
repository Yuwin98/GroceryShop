package admin.controller;

import DB.ProductManager;
import DB.UserManager;
import Model.Product;
import Model.User;
import util.Online;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProducts",urlPatterns = "/admin-products")
public class AdminProducts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = (int) request.getSession().getAttribute("userid");
        UserManager manager = new UserManager();

        if(manager.isAdmin(id)) {

            ProductManager pm = new ProductManager();
            List<Product> productList = pm.getAllProducts("product");
            request.setAttribute("productlist",productList);
            request.getRequestDispatcher("WEB-INF/admin-products.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("WEB-INF/admin-login.jsp").forward(request,response);
        }
    }
}
