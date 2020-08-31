package admin.controller;

import DB.UserManager;
import util.Online;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Authentication",urlPatterns = "/auth-admin")
public class Authentication extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("name");
        String password = request.getParameter("password");

        UserManager manager = new UserManager();
        int userId = -1;
        try {
            Thread.sleep(1000);
            userId = manager.userExist(username,password);
        }catch (InterruptedException e) {
            e.printStackTrace();
        }

        if(!manager.isActive(userId)){
            response.sendRedirect("admin");
            return;
        }

        if(manager.isAdmin(userId)) {
            manager.setOnline(userId, Online.ONLINE);
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(1800);
            session.setAttribute("userid",userId);
            session.setAttribute("admin",true);
            response.sendRedirect("admin-dashboard");
        }else {
            response.sendRedirect("admin");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
