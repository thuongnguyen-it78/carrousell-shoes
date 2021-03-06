package thuongnguyen.it78.models;

import thuongnguyen.it78.daos.ShoesDAO;

import java.io.Serializable;

public class Shoes implements Serializable {
    private int id;
    private String name;
    private String description;
    private int type;
    private String image;
    private double price;
    private int stock;
    private String color;
    private String size;
    private int active;
    private int categoryID;

    public Shoes() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getCategoryName() {
        return ShoesDAO.getCategoryByShoesID(this.id);
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public int getSizeInt() {
        if(size.equals("39")) return 1;
        if(size.equals("40")) return 2;
        if(size.equals("41")) return 3;
        else return 4;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Shoes{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", type=" + type +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                '}';
    }
}
