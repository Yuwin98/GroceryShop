package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "NavServlet",urlPatterns = "/category")
public class NavServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String type = request.getParameter("type");
        String id = request.getParameter("id");
        request.setAttribute("type",type);
        request.setAttribute("id",id);
        request.setAttribute("search","");


        if(type.isEmpty()){
            request.getRequestDispatcher("/").forward(request,response);
        }else {
            request.getRequestDispatcher("/page").forward(request,response);
        }

    }
}
