package admin.controller;

import DB.UserManager;
import util.Online;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminLogout", urlPatterns = "/admin-logout")
public class AdminLogout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserManager manager = new UserManager();
        int id = (int) request.getSession().getAttribute("userid");
        manager.setOnline(id, Online.OFFLINE);

        request.getSession().removeAttribute("userid");
        request.getSession().removeAttribute("admin");
        request.getSession().invalidate();
        request.getRequestDispatcher("WEB-INF/admin-login.jsp").forward(request,response);

    }
}
