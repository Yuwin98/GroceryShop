package admin.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminDashboard",urlPatterns = "/admin-dashboard")
public class AdminDashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!request.getSession().getAttribute("userid").equals("")) {
            request.getRequestDispatcher("WEB-INF/admin-dashboard.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        }
    }
}
