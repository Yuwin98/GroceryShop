package admin.controller;


import DB.OrderManager;
import DB.UserManager;
import Model.Orders;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDashboard",urlPatterns = "/admin-dashboard")
public class AdminDashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!request.getSession().getAttribute("userid").equals("")) {
            int uid = (int) request.getSession().getAttribute("userid");
            UserManager manager = new UserManager();
            User user =  manager.getUserAdmin(uid);
            OrderManager orderManager = new OrderManager();
            List<Orders> orderList = orderManager.getOrders();
            request.setAttribute("orderList",orderList);
            request.setAttribute("currentUser",user);
            request.getRequestDispatcher("WEB-INF/admin-dashboard.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        }
    }
}
