package DB;

import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductManager implements ProductDAO {

    private Connection conn;


    public ProductManager(){
        conn = DBConnection.getConnection();
    }



    @Override
    public List<Product> getAllProducts(String table) {
        List<Product> products = new ArrayList<>();

        try {
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("Select * from " + table);

            while (resultSet.next()){
                Product product = new Product();
                product.setName(resultSet.getString("name"));
                product.setId(resultSet.getInt("id"));
                product.setPrice(resultSet.getString("price"));
                product.setPath(resultSet.getString("path"));
                product.setType(resultSet.getString("type"));

                products.add(product);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return  products;
    }

    @Override
    public Product getProduct(String database, int id) {
        Product product = new Product();
        try {
            PreparedStatement pstmt = conn.prepareStatement("Select  * from " + database + " where id=?");
            pstmt.setInt(1,id);
            ResultSet  resultSet = pstmt.executeQuery();

            while (resultSet.next()){

                product.setName(resultSet.getString("name"));
                product.setPath(resultSet.getString("price"));
                product.setId(resultSet.getInt("id"));
                product.setPrice(resultSet.getString("price"));
                product.setPath(resultSet.getString("path"));

            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public boolean deleteProduct(String database, int id) {

        int records = 0;

        try {
            PreparedStatement pstmt = conn.prepareStatement("DELETE  from " + database + " where id=?");
            pstmt.setInt(1,id);
            records = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return records == 1;

    }

    @Override
    public boolean updateProduct(String database, int id,Product product) {
        int records = 0;

        try {
            PreparedStatement pstmt = conn.prepareStatement("Update " + database + " set name=?, price=?,path=?,description=? where id=?");
            pstmt.setString(1,product.getName());
            pstmt.setString(2,product.getPrice());
            pstmt.setString(3,product.getPath());
            pstmt.setString(4,product.getDescription());
            pstmt.setInt(5,id);
            records = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return records == 1;
    }

    @Override
    public boolean insertProduct(String database, Product product) {
        int records = 0;

        try {
            PreparedStatement pstmt = conn.prepareStatement("Insert into " + database + "(name,price,path,description) values(?,?,?,?)");
            pstmt.setString(1,product.getName());
            pstmt.setString(2,product.getPrice());
            pstmt.setString(3,product.getPath());
            pstmt.setString(4,product.getDescription());
            records = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return records == 1;
    }
}
