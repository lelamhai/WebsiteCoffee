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
public class CreateProductModel {
    private String productName;
    private double basePrice;
    private int categoryId;
    private boolean haveType;
    private List<VariantDetailModel> productVariants = null;
    private boolean isDirectSale;

    // Getters and Setters
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public boolean isHaveType() {
        return haveType;
    }

    public void setHaveType(boolean haveType) {
        this.haveType = haveType;
    }

    public List<VariantDetailModel> getProductVariants() {
        return productVariants;
    }

    public void setProductVariants(List<VariantDetailModel> productVariants) {
        this.productVariants = productVariants;
    }

    public boolean isDirectSale() {
        return isDirectSale;
    }

    public void setDirectSale(boolean directSale) {
        isDirectSale = directSale;
    }
}
