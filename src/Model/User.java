package Model;

import java.io.Serializable;

public class User implements Serializable {

    private int id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String contactNumber;
    private String path;
    private int cart_count;
    private String role;
    private int active;
    private int online;


    public User() {
        id = 0;
        name = "";
        username = "";
        email = "";
        password = "";
        cart_count = 0;
        contactNumber = "";
        path = "N/A";
        role = "";
        active = 0;
        online = 0;

    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCart_count() {
        return cart_count;
    }

    public void setCart_count(int cart_count) {
        this.cart_count = cart_count;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int isOnline() {
        return online;
    }

    public void setOnline(int online) {
        this.online = online;
    }
}
