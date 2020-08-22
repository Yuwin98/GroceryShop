package admin.controller;

import DB.UserManager;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteUser",urlPatterns = "/delete-user")
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("userid"));
        UserManager manager = new UserManager();
        int userId = (int) request.getSession().getAttribute("userid");

        if(manager.userExist(id) && (userId != id)) {
            manager.removeUser(id);
        }

        List<User> userList = manager.getUsersAdmin(id);
        request.setAttribute("userlist",userList);
        request.getRequestDispatcher("WEB-INF/admin-users.jsp").forward(request,response);
    }
}
