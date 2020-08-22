package Controller;

import DB.CartManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveFromCart",urlPatterns = "/removecart")
public class RemoveFromCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String type = request.getParameter("type");
            int id = Integer.parseInt(request.getParameter("id"));
            String search = request.getParameter("search");

            CartManager manager = new CartManager();
            manager.removeFromCart(1,id);

            request.setAttribute("search",search);
            request.setAttribute("type",type);
            request.getRequestDispatcher("/page").forward(request,response);
    }
}
