/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL.shop;

/**
 *
 * @author LEGION
 */
public class ProductDetail extends Product{

    private int ProductID;
    private int ProductDetailID;
    private int ProductStorage;
    private double UnitPrice;
    private String Picture;
    private String Coler;
    private int UnitsInStock;
    private int UnitsOnOrder;
    private int Count;
    public ProductDetail() {
    }

    public ProductDetail(int ProductID, int ProductDetailID, int ProductStorage,
            double UnitPrice, String Coler, int UnitsInStock, int UnitsOnOrder) {
        this.ProductID = ProductID;
        this.Coler = Coler;
        this.ProductStorage = ProductStorage;
        this.UnitPrice = UnitPrice;
        this.ProductDetailID = ProductDetailID;
    }
    public ProductDetail(String Color, int Count) {
        this.Coler = Color;
        this.Count = Count;
    }

    public ProductDetail(int ProductStorage, int Count) {
        this.ProductStorage = ProductStorage;
        this.Count = Count;
    }

    
    public int getCount() {
        return Count;
    }

    public void setCount(int count) {
        this.Count = count;
    }

    public ProductDetail(int UnitsInStock, int ProductID, String ProductName, String Picture, double Price) {
        super(ProductID, ProductName, Picture, Price);
        this.UnitsInStock = UnitsInStock;
        this.UnitsOnOrder = UnitsOnOrder;
    }

    public ProductDetail(int ProductID, int ProductDetailID, int ProductStorage, double UnitPrice,
            String Coler, int UnitsInStock, int UnitsOnOrder, String Picture) {
        this.ProductID = ProductID;
        this.Coler = Coler;
        this.ProductStorage = ProductStorage;
        this.UnitPrice = UnitPrice;
        this.ProductDetailID = ProductDetailID;
        this.UnitsInStock = UnitsInStock;
        this.UnitsOnOrder = UnitsOnOrder;
        this.Picture = Picture;
    }

    public ProductDetail(int ProductDetailID, int ProductStorage, double UnitPrice, String Coler, 
            int UnitsInStock, int UnitsOnOrder) {
        this.ProductDetailID = ProductDetailID;
        this.ProductStorage = ProductStorage;
        this.UnitPrice = UnitPrice;
        this.Coler = Coler;
        this.UnitsInStock = UnitsInStock;
        this.UnitsOnOrder = UnitsOnOrder;
    }

    public ProductDetail(int ProductStorage) {
        this.ProductStorage = ProductStorage;
    }

    public ProductDetail(String Coler) {
        this.Coler = Coler;
    }
   

    public int getProductDetailID() {
        return ProductDetailID;
    }

    public void setProductDetailID(int ProductDetailID) {
        this.ProductDetailID = ProductDetailID;
    }

    public int getProductStorage() {
        return ProductStorage;
    }

    public void setProductStorage(int ProductStorage) {
        this.ProductStorage = ProductStorage;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public String getColer() {
        return Coler;
    }

    public void setColer(String Coler) {
        this.Coler = Coler;
    }

    public int getUnitsInStock() {
        return UnitsInStock;
    }

    public void setUnitsInStock(int UnitsInStock) {
        this.UnitsInStock = UnitsInStock;
    }

    public int getUnitsOnOrder() {
        return UnitsOnOrder;
    }

    public void setUnitsOnOrder(int UnitsOnOrder) {
        this.UnitsOnOrder = UnitsOnOrder;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

}
