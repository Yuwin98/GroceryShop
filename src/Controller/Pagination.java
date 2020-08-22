package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Pagination",urlPatterns = "/pages")
public class Pagination extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        int page = Integer.parseInt(request.getParameter("page"));

        request.setAttribute("page",page);
        request.setAttribute("type",type);
        request.setAttribute("search","");
        request.getRequestDispatcher("/page").forward(request,response);
    }
}
