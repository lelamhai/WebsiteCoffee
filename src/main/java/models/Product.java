/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int productId;
    private String productCode;
    private String productName;
    private String categoryName;
    private double basePrice;
    private String listPrice;
    private boolean isAvailable;
    private String urlImage;
    private String sizes;

    // Getter và Setter cho productId
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    // Getter và Setter cho productCode
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    // Getter và Setter cho productName
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    // Getter và Setter cho categoryName
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    // Getter và Setter cho basePrice
    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    // Getter và Setter cho listPrice
    public String getListPrice() {
        return listPrice;
    }

    public void setListPrice(String listPrice) {
        this.listPrice = listPrice;
    }

    // Getter và Setter cho isAvailable
    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    // Getter và Setter cho urlImage
    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    // Getter và Setter cho sizes
    public String getSizes() {
        return sizes;
    }

    public void setSizes(String sizes) {
        this.sizes = sizes;
    }
}
