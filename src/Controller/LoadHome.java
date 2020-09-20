package Controller;

import DB.CartManager;
import DB.DBConnection;
import Model.Article;
import Model.HomeCard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class LoadHome extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = "WEB-INF/" + "index.jsp";
        try {
            Connection conn = DBConnection.getConnection();
            CartManager manager  = new CartManager();
            List<Article> articleList = new ArrayList<>();
            Map<String,List<HomeCard>> cardMap = new HashMap<>();
            List<String> promoList = new ArrayList<>();

            Statement pstmt = conn.createStatement();

            ResultSet articleSet = pstmt.executeQuery("Select * from cards");


            while (articleSet.next()){

                Article article = new Article();
                article.setTitle(articleSet.getString("title"));
                article.setDescription(articleSet.getString("description"));
                article.setShortDescription(articleSet.getString("descriptionshort"));
                article.setPath(articleSet.getString("path"));
                articleList.add(article);
            }

            ResultSet cardSet = pstmt.executeQuery("SELECT * from common ");

            while (cardSet.next()) {
                HomeCard homeCard = new HomeCard();
                homeCard.setName(cardSet.getString("name"));
                homeCard.setPrice(cardSet.getString("price"));
                homeCard.setPath(cardSet.getString("path"));
                homeCard.setType(cardSet.getString("type"));
                homeCard.setId(cardSet.getInt("id"));

                if(cardMap.containsKey(homeCard.getType())) {
                    cardMap.get(homeCard.getType()).add(homeCard);
                }else {
                    List<HomeCard> homeCards = new ArrayList<>();
                    homeCards.add(homeCard);
                    cardMap.put(homeCard.getType(),homeCards);
                }
            }

            ResultSet promoSet = pstmt.executeQuery("SELECT * from promo ");

            while (promoSet.next()) {
                promoList.add(promoSet.getString("path"));
            }

            int count = manager.getCartCount(1);

            request.setAttribute("promos",promoList);
            request.setAttribute("cartLength",count);
            request.setAttribute("homeCards",cardMap);
            request.setAttribute("cards", articleList);
            request.getRequestDispatcher(page).forward(request,response);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
