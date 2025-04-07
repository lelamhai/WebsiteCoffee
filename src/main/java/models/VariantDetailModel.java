/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
public class VariantDetailModel {
    private String size;
    private double price;
    
    // Getters and Setters
    public String getSizeName() {
        return size;
    }

    public void setSizeName(String sizeName) {
        this.size = sizeName;
    }

    public double getBasePrice() {
        return price;
    }

    public void setBasePrice(double basePrice) {
        this.price = basePrice;
    }
}
