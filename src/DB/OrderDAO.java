package DB;


import Model.Orders;

import java.util.List;

public interface OrderDAO {

    Orders getOrder(int orderId);
    List<Orders> getOrders();
    void insertOrder(Orders order);
    void deleteOrder(int orderId);
    void updateOrder(int orderId,Orders order);

}
