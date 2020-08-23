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

@WebServlet(name = "AdminAddUser",urlPatterns = "/add-user")
public class AddUser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if(request.getSession().getAttribute("admin").equals(false)){
            request.getRequestDispatcher("/").forward(request,response);
        }


        User user = Upload.UploadImage(getServletContext(),request);

        UserManager manager = new UserManager();
        if(manager.userExist(user.getUsername())) {
            request.setAttribute("username-error","Username Already Taken");
            request.setAttribute("user",user);
            request.getRequestDispatcher("WEB-INF/admin-user-edit.jsp").forward(request,response);
        }else {
            manager.addUserAdmin(user);
            response.sendRedirect("admin-users");
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        boolean isAdmin  = request.getSession().getAttribute("admin") != null && (boolean) request.getSession().getAttribute("admin");

        if(isAdmin){
            request.getRequestDispatcher("WEB-INF/admin-user-edit.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("/").forward(request,response);
        }




    }
}
