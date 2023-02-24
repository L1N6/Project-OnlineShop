/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.shop;

import DAL.shop.Comments;
import DAL.DBcontext;
import DAL.shop.Product;
import DAL.shop.ProductDetail;
import DAL.shop.ProductInfor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class ProductDAO extends DBcontext {

    ResultSet rs;
    PreparedStatement ps;

    public List<ProductInfor> getAllProduct() throws SQLException {
        List<ProductInfor> listProduct = new ArrayList<ProductInfor>();
        Product p = new Product();
        Comments c = new Comments();
        ProductDetail pd = new ProductDetail();
        try {

            String sql = "select p.ProductID, p.Picture, ProductName, p.Price, avg(c.Rate) as Average, sum(c.ProductID) as TotalComments \n"
                    + "from Comments c inner join Products p on c.ProductID = p.ProductID\n"
                    + "group by c.ProductID, p.ProductName, p.Price, p.ProductID, p.Picture";
            ps = getConnection().prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                double Price = rs.getDouble("Price");
                p = new Product(ProductID, ProductName, Picture, Price);
                int Rate = rs.getInt("Average");
                c = new Comments(Rate);
                int TotalComment = rs.getInt("TotalComments");
                listProduct.add(new ProductInfor(c, p, TotalComment));
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listProduct;
    }

    public List<ProductInfor> searchProducts(String condition) throws SQLException {
        List<ProductInfor> listProduct = new ArrayList<ProductInfor>();
        Product p = new Product();
        Comments c = new Comments();
        try {
            String sql = "select p.ProductID, p.Picture, ProductName, p.Price, avg(c.Rate) as Average, sum(c.ProductID) as TotalComments \n"
                    + "from Comments c inner join Products p on c.ProductID = p.ProductID and ProductName COLLATE SQL_Latin1_General_Cp850_CI_AS like '%'+?+'%'\n"
                    + "group by c.ProductID, p.ProductName, p.Price, p.ProductID, p.Picture";
            ps = getConnection().prepareCall(sql);
            ps.setString(1, condition);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                double Price = rs.getDouble("Price");
                p = new Product(ProductID, ProductName, Picture, Price);
                int Rate = rs.getInt("Average");
                c = new Comments(Rate);
                int TotalComment = rs.getInt("TotalComments");
                listProduct.add(new ProductInfor(c, p, TotalComment));
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listProduct;
    }

    public List<ProductInfor> sortProducts(String condition) throws SQLException {
        List<ProductInfor> listProduct = new ArrayList<ProductInfor>();
        Product p = new Product();
        Comments c = new Comments();
        String sql = "";
        if (condition.equals("latest")) {
            sql = "select p.ProductID, p.Picture, ProductName, p.Price, avg(c.Rate) as Average, sum(c.ProductID) as TotalComments \n"
                    + "from Comments c inner join Products p on c.ProductID = p.ProductID\n"
                    + "group by c.ProductID, p.ProductName, p.Price, p.ProductID, p.Picture\n"
                    + "order by p.ProductID desc";
        } else if (condition.equals("popularity")) {
            sql = "select * from Products order by ProductID desc";
        } else {

        }
        try {
            ps = getConnection().prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                double Price = rs.getDouble("Price");
                p = new Product(ProductID, ProductName, Picture, Price);
                int Rate = rs.getInt("Average");
                c = new Comments(Rate);
                int TotalComment = rs.getInt("TotalComments");
                listProduct.add(new ProductInfor(c, p, TotalComment));
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listProduct;
    }

    public List<ProductDetail> getAllColor() throws SQLException {
        List<ProductDetail> listColor = new ArrayList<ProductDetail>();
        ProductDetail pd = new ProductDetail();
        String sql = "select Coler, count(pd.ProductID) as CountColor from ProductDetails pd group by pd.Coler";
        try {
            ps = getConnection().prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Color = rs.getString("Coler");
                int CountColor = rs.getShort("CountColor");
                pd = new ProductDetail(Color, CountColor);
                listColor.add(pd);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listColor;
    }

    public List<ProductDetail> getAllProductStorage() throws SQLException {
        List<ProductDetail> listColor = new ArrayList<ProductDetail>();
        ProductDetail pd = new ProductDetail();
        String sql = "select ProductStorage, count(ProductID) as CountStorage from ProductDetails group by ProductStorage";
        try {
            ps = getConnection().prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Storage = rs.getInt("ProductStorage");
                int CountStorage = rs.getShort("CountStorage");
                pd = new ProductDetail(Storage, CountStorage);
                listColor.add(pd);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listColor;
    }

    public List<ProductInfor> getFilterProduct(int priceCondition, String colorCondition, int storageCondition) throws SQLException {
        List<ProductInfor> listProduct = new ArrayList<ProductInfor>();
        Product p = new Product();
        Comments c = new Comments();
        int array[] = new int[3];
        int count = 1;
        String sql = "select pd.ProductID, pd.Picture, p.ProductName, pd.Coler, pd.ProductStorage, pd.UnitPrice, \n" +
"avg(c.Rate) as Average, sum(c.ProductID) as TotalComments \n" +
"from Comments c inner join Products p on c.ProductID = p.ProductID \n" +
"inner join ProductDetails pd on p.ProductID = pd.ProductID ";
        try {
            if (priceCondition != 0) {
                sql += " and pd.UnitPrice between ? and ?";
                array[0] = 1;
            }
            if (!"All".equals(colorCondition)) {
                sql += " and pd.Coler = ?";
                array[1] = 2;
            }
            if (storageCondition != 0) {
                sql += " and pd.ProductStorage = ?";
                array[2] = 3;
            }
            sql += " group by c.ProductID, p.ProductName, pd.UnitPrice, pd.ProductID, pd.Picture, pd.Coler, pd.ProductStorage";
            ps = getConnection().prepareCall(sql);
            if(array[0] != 0){
                ps.setInt(count++, (priceCondition-1) * 10000000);
                ps.setInt(count++, priceCondition * 10000000);
            }
            if(array[1] != 0){
                ps.setString(count++, colorCondition);
            }
            if(array[2] != 0){
                ps.setInt(count, storageCondition);
            }
            System.out.println(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                double Price = rs.getDouble("UnitPrice");
                p = new Product(ProductID, ProductName, Picture, Price);
                int Rate = rs.getInt("Average");
                c = new Comments(Rate);
                int TotalComment = rs.getInt("TotalComments");
                listProduct.add(new ProductInfor(c, p, TotalComment));
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return listProduct;
    }
}
