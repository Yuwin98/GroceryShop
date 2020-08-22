package DB;

import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartManager implements CartDAO {


    private Connection conn;

    public CartManager() {

        conn = DBConnection.getConnection();
    }

    @Override
    public List<Product> getCartItems(int userId) {
        List<Product> products = new ArrayList<>();

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select * from cart where user_id = ?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();


            while (resultSet.next()){
                Product product = new Product();
                product.setName(resultSet.getString("name"));
                product.setId(resultSet.getInt("id"));
                product.setPrice(resultSet.getString("price"));
                product.setPath(resultSet.getString("path"));

                products.add(product);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return  products;
    }

    @Override
    public int addToCart(int userId, int productId) {
        int result = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement("Insert into  cart(user_id,product_id) value(?,?)");
            pstmt.setInt(1,userId);
            pstmt.setInt(2,productId);
            result = pstmt.executeUpdate();

            if(result == 1) {
                increaseCartCount(userId);
                result = getCartCount(userId);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }

    @Override
    public int removeFromCart(int userId, int productId) {
        int result = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement("Delete from cart where user_id = ? and product_id = ?");
            pstmt.setInt(1,userId);
            pstmt.setInt(2,productId);
            result = pstmt.executeUpdate();

            if(result == 1) {
                decreaseCartCount(userId);
                result = getCartCount(userId);
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }

    @Override
    public boolean incrementCartItemCount(int userId, int productId) {

        int result = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement("Update cart set item_count = (item_count + 1) from user where user_id = ? and prodcut_id = ?");
            pstmt.setInt(1,userId);
            pstmt.setInt(2,productId);
            result = pstmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return  result == 1;
    }

    @Override
    public boolean decrementCartItemCount(int userId, int productId) {
        int result = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement("Update cart set item_count = (item_count - 1) from user where user_id = ? ans product_id = ?");
            pstmt.setInt(1,userId);
            pstmt.setInt(2,productId);
            result = pstmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return  result == 1;
    }

    @Override
    public int getCartCount(int userId) {
        int count = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement("Select cart_count from user where id = ?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt("cart_count");
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return  count;
    }

    @Override
    public void increaseCartCount(int userId) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("Update user set cart_count = (cart_count + 1)  where id = ? ");
            pstmt.setInt(1,userId);
            pstmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void decreaseCartCount(int userId) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("Update user set cart_count = (cart_count - 1)  where id = ? ");
            pstmt.setInt(1,userId);
            pstmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
