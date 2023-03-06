/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL.cart;

/**
 *
 * @author LEGION
 */
public class GuestProductCart {
    private int ProductDetailID;
    private String ProductName;
    private int Quantity;
    private double Price;
    private String Picture;

    public GuestProductCart(int ProductDetailID, String ProductName, double Price, String Picture) {
        this.ProductDetailID = ProductDetailID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.Picture = Picture;
    }

    public double getPrice() {
        return Price;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }
    public GuestProductCart() {
    }

    public int getProductDetailID() {
        return ProductDetailID;
    }

    public void setProductDetailID(int ProductDetailID) {
        this.ProductDetailID = ProductDetailID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
}
