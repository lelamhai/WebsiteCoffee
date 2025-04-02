/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductModel {
    private Date createdAt;
    private Date updatedAt;
    private String createdBy;
    private String updatedBy;
    private boolean deleted;
    private int id;
    private String productCode;
    private String productName;
    private Category category;
    private String imageUrl;
    private double basePrice;
    private boolean haveType;
    private String status;
    private boolean isDirectSale;
    private Object warehouse;
    private List<ProductVariant> productVariants;

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
    public boolean isDeleted() { return deleted; }
    public void setDeleted(boolean deleted) { this.deleted = deleted; }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getProductCode() { return productCode; }
    public void setProductCode(String productCode) { this.productCode = productCode; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }
    public boolean isHaveType() { return haveType; }
    public void setHaveType(boolean haveType) { this.haveType = haveType; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    @JsonProperty("isDirectSale")
    public boolean getIsDirectSale() { return isDirectSale; }
    
    @JsonProperty("isDirectSale")
    public void setIsDirectSale(boolean isDirectSale) { this.isDirectSale = isDirectSale; }
    
    public Object getWarehouse() { return warehouse; }
    public void setWarehouse(Object warehouse) { this.warehouse = warehouse; }
    public List<ProductVariant> getProductVariants() { return productVariants; }
    public void setProductVariants(List<ProductVariant> productVariants) { this.productVariants = productVariants; }
}