package admin.controller;

import DB.UserManager;
import Model.User;
import util.Upload;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateUser",urlPatterns = "/update-user")
public class UpdateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        User updatedUser = Upload.UploadImage(getServletContext(),request);

        UserManager manager = new UserManager();
        manager.updateUser(updatedUser.getId(),updatedUser);
        response.sendRedirect("admin-users");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isAdmin  = request.getSession().getAttribute("admin") != null && (boolean) request.getSession().getAttribute("admin");

        if(!isAdmin){
            request.getRequestDispatcher("/").forward(request,response);
        }


        int id = request.getParameter("userid") != null ? Integer.parseInt(request.getParameter("userid")) : 0;

        if (id != 0) {
            UserManager manager = new UserManager();
            User user = manager.getUserAdmin(id);
            request.setAttribute("user", user);
            request.setAttribute("id",id);
        }
        request.getRequestDispatcher("WEB-INF/admin-user-edit.jsp").forward(request,response);

    }
}
