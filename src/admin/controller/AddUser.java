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


        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        User user = Upload.UploadImage(getServletContext(),request);
        String password = request.getParameter("password") == null ? "password":request.getParameter("password");
        String contactNumber = String.valueOf(request.getParameter("contactnumber"));
        String role = request.getParameter("role");
        int active = request.getParameter("active") != null ? 1:0;

//        User user = new User();
//        user.setName(firstName + " " + lastName);
//        user.setUsername(username);
//        user.setEmail(email);
//        user.setPath(path);
//        user.setPassword(password);
//        user.setContactNumber(contactNumber);
//        user.setRole(role);
//        user.setActive(active);

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
