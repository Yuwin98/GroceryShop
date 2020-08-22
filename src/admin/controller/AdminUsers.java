package admin.controller;

import DB.UserManager;
import Model.User;
import util.Online;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUsers",urlPatterns = "/admin-users")
public class AdminUsers extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = (int) request.getSession().getAttribute("userid");
        UserManager manager = new UserManager();

        if(manager.isAdmin(id)) {
            manager.setOnline(id, Online.ONLINE);
            List<User> userList = manager.getUsersAdmin(id);
            request.setAttribute("userlist",userList);

            request.getRequestDispatcher("WEB-INF/admin-users.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("WEB-INF/admin-login.jsp").forward(request,response);
        }


    }
}
