package DB;

import Model.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderManager implements OrderDAO {
    private Connection conn;

    public OrderManager() {
        conn = DBConnection.getConnection();
    }

    @Override
    public Orders getOrder(int orderId) {
        Orders order = new Orders();
        try{
            PreparedStatement stmt = conn.prepareStatement("Select * from orders where id = ?");
            stmt.setInt(1,orderId);
            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                order.setId(resultSet.getInt("id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setUsername(resultSet.getString("username"));
                order.setItems(resultSet.getString("items"));
                order.setOrderDate(resultSet.getDate("order_date"));
                order.setTotal(resultSet.getDouble("total"));
                order.setStatus(resultSet.getString("status"));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public List<Orders> getOrders() {
        Orders order = new Orders();
        List<Orders> orderList = new ArrayList<>();
        try{
            PreparedStatement stmt = conn.prepareStatement("Select * from orders");
            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                order.setId(resultSet.getInt("id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setUsername(resultSet.getString("username"));
                order.setItems(resultSet.getString("items"));
                order.setOrderDate(resultSet.getDate("order_date"));
                order.setTotal(resultSet.getDouble("total"));
                order.setStatus(resultSet.getString("status"));
                orderList.add(order);
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return orderList;
    }

    @Override
    public void insertOrder(Orders order) {


        try{
            PreparedStatement stmt = conn.prepareStatement("Insert into orders(user_id,username,items,total,status)");

            stmt.setInt(1,order.getUserId());
            stmt.setString(2,order.getUsername());
            stmt.setString(3,order.getItems());
            stmt.setDouble(4,order.getTotal());
            stmt.setString(5,order.getStatus());

            stmt.executeUpdate();


        }catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void deleteOrder(int orderId) {
        try{
            PreparedStatement stmt = conn.prepareStatement("Delete from orders where id = ?");
            stmt.setInt(1,orderId);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrder(int orderId,Orders order) {
        try{
            PreparedStatement stmt = conn.prepareStatement("Update orders set status= ? where id = ?");
            stmt.setString(1,order.getStatus());
            stmt.setInt(2,orderId);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
