/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductDetailModel {
    private int productId;
    private String productName;
    private boolean haveType;
    private String urlImage;
    private int categoryId;
    private String categoryName;
    private double basePrice;
    private boolean isAvailable;
    private boolean isDirectSale;
    private List<VariantDetailModel> variants;


    // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public boolean isHaveType() {
        return haveType;
    }

    public void setHaveType(boolean haveType) {
        this.haveType = haveType;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public boolean isDirectSale() {
        return isDirectSale;
    }

    public void setDirectSale(boolean directSale) {
        isDirectSale = directSale;
    }

    public List<VariantDetailModel> getVariants() {
        return variants;
    }

    public void setVariants(List<VariantDetailModel> variants) {
        this.variants = variants;
    }
}
