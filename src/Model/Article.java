package Model;

import java.io.Serializable;

public class Article implements Serializable {

    private String title;
    private String description;
    private String shortDescription;
    private String path;

    public Article(){
        title = "";
        description = "";
        shortDescription = "";
        path = "";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
