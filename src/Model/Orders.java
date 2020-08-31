package Model;

import java.io.Serializable;
import java.sql.Date;

public class Orders implements Serializable {

    private int id;
    private int userId;
    private String username;
    private String items;
    private double total;
    private Date orderDate;
    private String status;

    public Orders() {
        id = 0;
        userId = 0;
        username = "";
        items = "";
        total = 0;
        orderDate = null;
        status = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
