package DB;

import Model.Product;

import java.util.List;

public interface ProductDAO {
    List<Product> getAllProducts(String database);
    Product getProduct(String database, int id);
    boolean deleteProduct(String database, int id);
    boolean updateProduct(String database, int id, Product product);
    boolean insertProduct(String database,Product product);
}
