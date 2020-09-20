package Controller;

import DB.UserManager;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterPassword",urlPatterns = "/register-pass")
public class RegisterPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        String password = request.getParameter("Password");
        String cPassword = request.getParameter("CPassword");
        if(password.equals(cPassword)){
            user.setPassword(password);
            UserManager manager = new UserManager();
            manager.addUser(user);
            response.sendRedirect("category");
        }else {
            request.getRequestDispatcher("WEB-INF/user-register2.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
