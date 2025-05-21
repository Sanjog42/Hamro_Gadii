package hamrogadi12345.controller.models;

public class CarModel {

    private int carID;
    private String brand;
    private String model;
    private double price;
    private String description;
    private String carCondition;
    private String url;
    private int categoryID;

    // Default constructor
    public CarModel() {
    }

    // Parameterized constructor
    public CarModel(int carID, String brand, String model, double price, String description, String carCondition, String url, int categoryID) {
        this.carID = carID;
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.description = description;
        this.carCondition = carCondition;
        this.url = url;
        this.categoryID = categoryID;
    }


    // Getters and Setters
    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCarCondition() {
        return carCondition;
    }

    public void setCarCondition(String carCondition) {
        this.carCondition = carCondition;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}