/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
public class ProductVariant {
    private int id;
    private Size size;
    private double addPrice;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Size getSize() { return size; }
    public void setSize(Size size) { this.size = size; }
    public double getAddPrice() { return addPrice; }
    public void setAddPrice(double addPrice) { this.addPrice = addPrice; }
}