package Model;

import java.io.Serializable;

public class HomeCard implements Serializable {

    private String name;
    private String price;
    private String path;
    private String type;
    private int id;

    public HomeCard(){
        id = 0;
        name = "";
        price = "";
        path = "";
        type = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
