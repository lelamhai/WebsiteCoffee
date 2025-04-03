/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;


/**
 *
 * @author ADMIN
 */

public class Pageable {
    private int pageNumber;
    private int pageSize;
    private int offset;
    private boolean paged;
    private boolean unpaged;

    // Getters and Setters
    public int getPageNumber() { return pageNumber; }
    public void setPageNumber(int pageNumber) { this.pageNumber = pageNumber; }
    
    public int getPageSize() { return pageSize; }
    public void setPageSize(int pageSize) { this.pageSize = pageSize; }
    
    public int getOffset() { return offset; }
    public void setOffset(int offset) { this.offset = offset; }
    
    public boolean isPaged() { return paged; }
    public void setPaged(boolean paged) { this.paged = paged; }
    
    public boolean isUnpaged() { return unpaged; }
    public void setUnpaged(boolean unpaged) { this.unpaged = unpaged; }
}
