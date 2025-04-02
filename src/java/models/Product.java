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
public class Product {
    private String createdAt;
    private String updatedAt;
    private Object createdBy; // Có thể null
    private Object updatedBy; // Có thể null
    private boolean deleted;
    private long id;
    private String productCode;
    private String productName;
    private Category category;
    private String imageUrl;
    private double basePrice;
    private boolean haveType;
    private String status;
    private boolean isDirectSale;
    private Object warehouse; // Có thể null
    private List<ProductVariants> productVariants;
}
