package com.freedom.week_8_task_freedom.model;

public class Product {

    private String productName;
    private double price;
    private int quantity;
    private String productCategory;
    private String product_image;

    public Product(String productName, double price, int quantity, String productCategory, String product_image) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.productCategory = productCategory;
        this.product_image = product_image;
    }

    public Product() {
    }



    public String getProductName() {
        return productName;
    }

    public void setName(String name) {
        this.productName = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getProductCategory() {
        return productCategory;
    }
    public void setProductCategory(String category) {
        this.productCategory = category;
    }
    public String getProduct_image() {
        return product_image;
    }
    public void setProduct_image(String image) {
        this.product_image = image;
    }

    @Override
    public String toString() {
        return "Product{" +
                ", name='" + productName + '\'' +
                ", price=" + price +
                '}';
    }
}
