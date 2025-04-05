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
public class ProductResponse {
    private List<Product> contents;
    private int pageNumber;
    private int pageSize;
    private int totalPages;
    private int totalElements;
    private int numberOfElements;

    // Getter và Setter cho contents
    public List<Product> getContents() {
        return contents;
    }

    public void setContents(List<Product> contents) {
        this.contents = contents;
    }

    // Getter và Setter cho pageNumber
    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    // Getter và Setter cho pageSize
    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    // Getter và Setter cho totalPages
    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    // Getter và Setter cho totalElements
    public int getTotalElements() {
        return totalElements;
    }

    public void setTotalElements(int totalElements) {
        this.totalElements = totalElements;
    }

    // Getter và Setter cho numberOfElements
    public int getNumberOfElements() {
        return numberOfElements;
    }

    public void setNumberOfElements(int numberOfElements) {
        this.numberOfElements = numberOfElements;
    }
}
