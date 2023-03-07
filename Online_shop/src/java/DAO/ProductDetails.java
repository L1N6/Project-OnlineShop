/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.Home.Brands;
import DAL.DBcontext;
import DAL.shop.Product;
import DAL.shop.ProductDetail;
import DAL.shop.ProductDetail;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author LEGION
 */
public class ProductDetails extends DBcontext {

    public static void main(String[] args) {
        ProductDetail pdt = new DAO.ProductDetails().getListPictureByIDAndColor("4", "Purple");
        System.out.println(pdt.getPicture());
        

    }

    public ProductDetail getProductDetail(String idProduct) {
        ProductDetail product = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] \n"
                    + "inner join Products on ProductDetails.ProductID = Products.ProductID\n"
                    + "WHERE ProductDetailID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, idProduct);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                String Picture = rs.getString("Picture");
                product = new ProductDetail(ProductDetail, ProductStorage, UnitPrice, Color, UnitsInStock,
                        UnitsOnOrder, ProductID, ProductName, Picture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public Product getProductsByProductID(String IDProduct) {
        Product product = new Product();
        try {
            String sql = "SELECT * FROM [Products] where ProductID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, IDProduct);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int BrandID = rs.getInt("BrandID");
                String Chip = rs.getString("Chip");
                int Ram = rs.getInt("Ram");
                String Pin = rs.getString("Pin");
                String OperatingSystem = rs.getString("OperatingSystem");
                String PhoneScreen = rs.getString("PhoneScreen");
                String Picture = rs.getString("Picture");
                double Price = rs.getBigDecimal("Price").doubleValue();
                product = new Product(ProductID, ProductName, BrandID, Chip, Ram,
                        Pin, OperatingSystem, PhoneScreen, Picture, Price);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    //Get brand throw BrandID
    public Brands getBrandThrowBrandID(int IDProduct) {
        Brands brands = new Brands();
        try {
            String sql = "SELECT * FROM [Brands] WHERE BrandID = (SELECT Products.BrandID FROM [Products] where ProductID = ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, IDProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BrandID = rs.getInt("BrandID");
                String BrandName = rs.getString("BrandName");
                String Picture = rs.getString("Picture");
                brands = new Brands(BrandID, BrandName, Picture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brands;
    }

    //get all picture of a product throw productID
    public ArrayList<ProductDetail> getListAllAttributeProductThrowID(int productID) {
        ArrayList<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [ProductDetails] where ProductID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductID = rs.getInt("ProductID");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Picture = rs.getString("Picture");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                list.add(new ProductDetail(ProductID, ProductDetail, ProductStorage,
                        UnitPrice, Color, UnitsInStock, UnitsOnOrder, Picture));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get all picture of a product throw productID
    public ArrayList<ProductDetail> getListStorageProductThrowID(int productID) {
        ArrayList<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT ProductDetails.ProductStorage\n"
                    + "FROM [ProductDetails] where ProductID = ? \n"
                    + "group by ProductDetails.ProductStorage;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductStorage = rs.getInt("ProductStorage");
                list.add(new ProductDetail(ProductStorage));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<ProductDetail> getListColerProductThrowID(int productID) {
        ArrayList<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT ProductDetails.Coler\n"
                    + "FROM [ProductDetails] where ProductID = ?\n"
                    + "group by ProductDetails.Coler;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String Color = rs.getString("Coler");
                list.add(new ProductDetail(Color));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //Get product price by productid & the smallest storage
    public int getUnitPriceByProductIdAndSmallestStorages(int productID) {
        int UnitPrice = 0;
        try {
            String sql = "SELECT ProductDetails.UnitPrice\n"
                    + "FROM [ProductDetails] where ProductDetails.ProductStorage = (\n"
                    + "Select Min(ProductDetails.ProductStorage) from ProductDetails where ProductDetails.ProductID = ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UnitPrice = rs.getInt("UnitPrice");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return UnitPrice;
    }

    public ProductDetail getProductDetailByIDAndStorage(String id, String storage) {
        ProductDetail pd = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] \n"
                    + "  inner join Products on ProductDetails.ProductID = Products.ProductID\n"
                    + "  where ProductDetails.ProductID = ? and ProductDetails.ProductStorage = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, storage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                String Picture = rs.getString("Picture");
                pd = new ProductDetail(ProductDetail, ProductStorage, UnitPrice, Color, UnitsInStock,
                        UnitsOnOrder, ProductID, ProductName, Picture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pd;
    }

    public ProductDetail getListPictureByIDAndColor(String id, String color) {
        ProductDetail pdt = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] WHERE ProductDetails.ProductID = ? and ProductDetails.Coler = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, color);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductID = rs.getInt("ProductID");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Picture = rs.getString("Picture");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                pdt = new ProductDetail(ProductID, ProductDetail, ProductStorage,
                        UnitPrice, Color, UnitsInStock, UnitsOnOrder, Picture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pdt;
    }
}
