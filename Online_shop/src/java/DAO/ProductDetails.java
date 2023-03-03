/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.Brands;
import DAL.DBcontext;
import DAL.Product;
import DAL.ProductDetail;
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
        

    }

    public Product getProductsByProductID(String IDProduct) {
        Product product = new Product();
        try {
            String sql = "SELECT * FROM [SHOP_DB_Test_21].[dbo].[Products] where ProductID = ?";
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
    public Brands getBrandThrowBrandID(int brandID) {
        Brands brands = new Brands();
        try {
            String sql = "SELECT *  FROM [SHOP_DB_Test_21].[dbo].[Brands] where BrandID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, brandID);
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
    public ArrayList<DAL.ProductDetail> getListAllAttributeProductThrowID(int productID) {
        ArrayList<DAL.ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [SHOP_DB_Test_21].[dbo].[ProductDetails] where ProductID = ?";
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
    public ArrayList<DAL.ProductDetail> getListStorageProductThrowID(int productID) {
        ArrayList<DAL.ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT ProductDetails.ProductStorage\n"
                    + "FROM [SHOP_DB_Test_21].[dbo].[ProductDetails] where ProductID = ? \n"
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

    public ArrayList<DAL.ProductDetail> getListColerProductThrowID(int productID) {
        ArrayList<DAL.ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT ProductDetails.Coler\n"
                    + "FROM [SHOP_DB_Test_21].[dbo].[ProductDetails] where ProductID = ?\n"
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
                    + "FROM [SHOP_DB_Test_21].[dbo].[ProductDetails] where ProductDetails.ProductStorage = (\n"
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
            String sql = "SELECT * FROM [SHOP_DB_Test_21].[dbo].[ProductDetails] where ProductID = ?"
                    + " and ProductStorage = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, storage);
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
                pd = new ProductDetail(ProductID, ProductDetail, ProductStorage,
                        UnitPrice, Color, UnitsInStock, UnitsOnOrder, Picture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pd;
    }

    //get list color products by productID
//    public ArrayList<ProductColors> getListColorOfAProductByProductID(int productID) {
//        ArrayList<ProductColors> list = new ArrayList<>();
//        try {
//            String sql = "SELECT [Coler] FROM [SHOP_DB_TEST_8].[dbo].[ProductColors] \n"
//                    + "join ProductStorages on ProductColors.ProductStorageID = ProductStorages.ProductStorageID\n"
//                    + "join Products on ProductStorages.ProductID = Products.ProductID and Products.ProductID = ?;";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, productID);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                String Coler = rs.getString("Coler");
//                list.add(new ProductColors(Coler));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//    public ArrayList<ProductStorages> getListProductStoragThrowProductID(int productID) {
//        ArrayList<ProductStorages> list = new ArrayList<>();
//        try {
//            String sql = "SELECT * FROM [SHOP_DB_TEST_8].[dbo].[ProductStorages] where [ProductID] = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, productID);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                int ProductStorageID = rs.getInt("ProductStorageID");
//                int ProductID = rs.getInt("ProductID");
//                int Storage = rs.getInt("Storage");
//                double UnitPrice = rs.getDouble("UnitPrice");
//                list.add(new ProductStorages(ProductStorageID, ProductID, Storage, UnitPrice));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}
