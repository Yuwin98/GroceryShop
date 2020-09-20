package Controller;

import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserRegister",urlPatterns = "/register")
public class UserRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String name = request.getParameter("FirstName") + " " +request.getParameter("LastName");
        String email = request.getParameter("Email");
        String username = request.getParameter("Username");
        String contactNumber = request.getParameter("ContactNumber");
        String address = request.getParameter("Address");
        user.setName(name);
        user.setEmail(email);
        user.setUsername(username);
        user.setContactNumber(contactNumber);
        user.setAddress(address);

        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        request.getRequestDispatcher("WEB-INF/user-register2.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
