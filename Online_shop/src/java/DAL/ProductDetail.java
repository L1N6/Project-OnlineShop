/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author LEGION
 */
public class ProductDetail extends Product{
    private int ProductDetail;
    private int ProductStorage;
    private double UnitPrice;
    private String Color;
    private int UnitsInStock;
    private int UnitsOnOrder;
    private int Count;
    public ProductDetail() {
    }

    public ProductDetail(String Color, int Count) {
        this.Color = Color;
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
    }
    
    public int getProductDetail() {
        return ProductDetail;
    }
    
    public void setProductDetail(int ProductDetail) {
        this.ProductDetail = ProductDetail;
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


    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
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
    
}
