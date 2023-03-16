/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.Home.Brands;
import DAL.DBcontext;
import DAL.shop.Comments;
import DAL.shop.Product;
import DAL.shop.ProductDetail;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author LEGION
 */
public class ProductDetails extends DBcontext {

    public static void main(String[] args) {
        Comments cmt = new DAO.ProductDetails().getRateByProductID(37);
        ArrayList<ProductDetail> list = new DAO.ProductDetails().mayAlsoYouLike(38);
        for (ProductDetail productDetail : list) {
            System.out.println("AVG: " + productDetail.getTotalRate() + " " + productDetail.getTotalComment() + "ID: " + productDetail.getProductDetail());
        }
        System.out.println(cmt.getTotalComment() + " " + cmt.getTotalRate());
        System.out.println("AVG: " + (double) cmt.getTotalRate() / cmt.getTotalComment());
        System.out.println("AVG: " + Math.ceil(cmt.getTotalRate() / cmt.getTotalComment()));

    }

    public ProductDetail getProductDetail(String idProduct) {
        ProductDetail product = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] \n"
                    + "inner join Products on ProductDetails.ProductID = Products.ProductID\n"
                    + "WHERE ProductDetailID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
        System.out.println(product.getColor());
        return product;
    }

    public Product getProductsByProductID(String IDProduct) {
        Product product = new Product();
        try {
            String sql = "SELECT * FROM [Products] where ProductID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
                    + "FROM [ProductDetails] where ProductDetailID = ? \n"
                    + "group by ProductDetails.ProductStorage;";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
                    + "FROM [ProductDetails] where ProductDetailID = ?\n"
                    + "group by ProductDetails.Coler;";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
                    + "  where ProductDetails.ProductDetailID = ? and ProductDetails.ProductStorage = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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

    public ArrayList<ProductDetail> getListPictureByIDAndColor(String id, String color) {
        ArrayList<ProductDetail> list = new ArrayList<>();
        ProductDetail pdt = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] WHERE ProductDetails.ProductID = ? and ProductDetails.Coler = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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
                list.add(pdt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductDetail getSpecifiByIDAndStorage(String id, int storage) {
        ProductDetail pd = new ProductDetail();
        try {
            String sql = "SELECT * FROM [ProductDetails] \n"
                    + "  inner join Products on ProductDetails.ProductID = Products.ProductID\n"
                    + "  where ProductDetails.ProductID = ? and ProductDetails.ProductStorage = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, id);
            ps.setInt(2, storage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int BrandID = rs.getInt("BrandID");
                String Chip = rs.getString("Chip");
                int Ram = rs.getInt("Ram");
                String Pin = rs.getString("Pin");
                String OperatingSystem = rs.getString("OperatingSystem");
                String PhoneScreen = rs.getString("PhoneScreen");
                String Picture = rs.getString("Picture");
                double Price = rs.getDouble("Price");
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                pd = new ProductDetail(ProductDetail, ProductStorage, UnitPrice, Color, UnitsInStock,
                        UnitsOnOrder, ProductID, ProductName, BrandID, Chip, Ram, Pin, OperatingSystem,
                        PhoneScreen, Picture, Price);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(pd.toString());
        return pd;
    }

    //May also you like
    public ArrayList<ProductDetail> mayAlsoYouLike(int productDetaiId) {
        ArrayList<ProductDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT pd.ProductDetailID, pd.ProductID, p.ProductName, pd.ProductStorage, pd.UnitPrice, pd.Picture, pd.Coler, pd.UnitsInStock, pd.UnitsOnOrder,\n"
                    + "(SELECT COUNT(c.ProductID) FROM Comments c WHERE p.ProductID = c.ProductID) AS TotalComment,\n"
                    + "(SELECT SUM(c.Rate) FROM Comments c WHERE p.ProductID = c.ProductID) AS TotalRate\n"
                    + "FROM products p\n"
                    + "INNER JOIN productdetails pd ON p.productID = pd.productID\n"
                    + "INNER JOIN brands b ON p.brandID = b.brandID\n"
                    + "WHERE p.brandID = (SELECT brandID FROM products WHERE productID = (SELECT ProductID FROM ProductDetails WHERE ProductDetailID = ?))\n"
                    + "AND pd.productdetailID <> ?\n"
                    + "AND NOT EXISTS (SELECT * FROM products p2 WHERE p.ProductID <> p2.ProductID AND p.ProductName = p2.ProductName)\n"
                    + "ORDER BY ABS(pd.UnitPrice - (SELECT UnitPrice FROM productdetails WHERE productdetailID = ?))\n"
                    + "OFFSET 0 ROWS\n"
                    + "FETCH NEXT 5 ROWS ONLY;";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, productDetaiId);
            ps.setInt(2, productDetaiId);
            ps.setInt(3, productDetaiId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductDetail = rs.getInt("ProductDetailID");
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int ProductStorage = rs.getInt("ProductStorage");
                double UnitPrice = rs.getDouble("UnitPrice");
                String Picture = rs.getString("Picture");
                String Color = rs.getString("Coler");
                int UnitsInStock = rs.getInt("UnitsInStock");
                int UnitsOnOrder = rs.getInt("UnitsOnOrder");
                int totalComment = rs.getInt("TotalComment");
                int totalRate = rs.getInt("totalRate");
                list.add(new ProductDetail(ProductDetail, ProductStorage, UnitPrice, Color, UnitsInStock, UnitsOnOrder,
                        totalComment, totalRate, ProductID, ProductName, Picture));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //listRate
    public Comments getRateByProductID(int productID) {
        Comments cmt = new Comments();
        int sum = 0, count = 0;
        try {
            String sql = "SELECT SUM(Comments.Rate) as TotalRate, COUNT(Comments.ProductID) as TotalComment FROM [Comments] "
                    + "WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductDetailID = ?) ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int TotalRate = rs.getInt("TotalRate");
                int TotalComment = rs.getInt("TotalComment");
                cmt = new Comments(TotalRate, TotalComment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cmt;
    }
    
    //REVIEW PART
    //Find AccountID BY Email
    
}
