package Controller;

import DB.CartManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddToCart",urlPatterns = "/addcart")
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        String search = request.getParameter("search");

        CartManager manager = new CartManager();
        manager.addToCart(1,id);

        request.setAttribute("search",search);
        request.setAttribute("type",type);
        request.getRequestDispatcher("/page").forward(request,response);
    }
}
