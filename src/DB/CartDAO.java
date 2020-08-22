package DB;

import Model.Product;

import java.util.List;

public interface CartDAO {

    List<Product> getCartItems(int userId);
    int addToCart(int userId, int productId);
    int removeFromCart(int userId, int productId);
    boolean incrementCartItemCount(int userId,int productId);
    boolean decrementCartItemCount(int userId,int productId);
    int getCartCount(int userId);
    void increaseCartCount(int userId);
    void decreaseCartCount(int userId);

}
