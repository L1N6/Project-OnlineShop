/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBcontext;
import DAL.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class ProductDAO extends DBcontext {
    
    public List<Product> getAllProduct(){
        List<Product> listProduct = new ArrayList<Product>();
        Product p = new Product();
        try {
            
            String sql = "select * from Products";
            PreparedStatement ps = getConnection().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                p = new Product(ProductID, ProductName, Picture);
                listProduct.add(p);
            }
        } catch (Exception e) {
        }
        return listProduct;
    }
    
    public List<Product> searchProducts(String condition){
        List<Product> listProduct = new ArrayList<Product>();
        Product p = new Product();
        try {
            String sql = "select * from Products where ProductName COLLATE SQL_Latin1_General_Cp850_CI_AS like '%'+?+'%'";
            PreparedStatement ps = getConnection().prepareCall(sql);
            ps.setString(1, condition);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                p = new Product(ProductID, ProductName, Picture);
                listProduct.add(p);
            }
        } catch (Exception e) {
        }
        return listProduct;
    }
    
    public List<Product> sortProducts(String condition){
        List<Product> listProduct = new ArrayList<Product>();
        Product p = new Product();
        try {
            String sql = "select * from Products order by ProductID desc";
            PreparedStatement ps = getConnection().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                p = new Product(ProductID, ProductName, Picture);
                listProduct.add(p);
            }
        } catch (Exception e) {
        }
        return listProduct;
    }
}
