/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Admin;

import DAL.DBcontext;
import DAL.Admin.Product;
import DAL.Home.ProductDiscountUnitOnOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

/**
 *
 * @author blabl
 */
public class AdminDAO extends DBcontext{
    ResultSet rs;
    PreparedStatement ps;
    public ArrayList<Product> getProduct() throws SQLException {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Date date = java.util.Calendar.getInstance().getTime();
            String sql = "select c.Price,g.BrandName, c.ProductID,c.ProductName,e.UnitsInStock,e.UnitsOnOrder,c.Picture,b.Discount,d.Rate,d.AmountRate,a.EventName,a.StartEvent,a.EndEvent from [Events] as a inner join Discounts \n" +
"                     as b on a.EventID=b.EventID right join Products as c on b.ProductID=c.ProductID\n" +
"                    left join (SELECT ProductID,AVG(Rate) as Rate,Count(Rate) as AmountRate FROM Comments GROUP BY ProductID) as d \n" +
"                    on c.ProductID = d.ProductID\n" +
"                    left join(select ProductID,SUM(UnitsInStock) as UnitsInStock , SUM(UnitsOnOrder) as UnitsOnOrder from ProductDetails group by ProductID) as e\n" +
"                    on c.ProductID = e.ProductID\n" +
"                    inner join Brands as g On c.BrandID = g.BrandID";

            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                    
                    
                    Product product = new Product();
                    
                    
                    
                    if(rs.getFloat("Discount") == 0 ){
                        int productID = rs.getInt("ProductID");
                        String productName = rs.getString("ProductName");
                        String picture = rs.getString("Picture");
                        float price = rs.getFloat("Price");
                        int rate = rs.getInt("Rate");
                        int amountRate = rs.getInt("AmountRate");
                        int unitInStock = rs.getInt("UnitsInStock");
                        int unitOnOrder = rs.getInt("UnitsOnOrder");
                        String brandName = rs.getString("BrandName");
                        String EventName = rs.getString("EventName");
                        product = new Product(productID, productName, unitInStock, unitOnOrder, brandName);
                        list.add(product);
                        
                    }else
                        
                    
                    
                    {
                        Date dateS = rs.getDate("StartEvent");
                        Date dateE = rs.getDate("EndEvent");

                    if (dateS.before(date) && date.before(dateE)) {
                        int productID = rs.getInt("ProductID");
                        String productName = rs.getString("ProductName");
                        String picture = rs.getString("Picture");
                        float discount = rs.getFloat("Discount");
                        float price = rs.getFloat("Price");
                        int rate = rs.getInt("Rate");
                        int amountRate = rs.getInt("AmountRate");
                        int unitInStock = rs.getInt("UnitsInStock");
                        int unitOnOrder = rs.getInt("UnitsOnOrder");
                        String brandName = rs.getString("BrandName");
                        String EventName = rs.getString("EventName");
                        product = new Product(productID, productName, unitInStock, unitOnOrder, brandName);
                        list.add(product);
                        
                    
                    
                    
            
               
       }
            
             
            }
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }
}
