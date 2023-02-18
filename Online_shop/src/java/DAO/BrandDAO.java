/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.BrandAndQuantity;
import DAL.DBcontext;
import DAL.ProductDiscountUnitOnOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author blabl
 */
public class BrandDAO extends DBcontext{
    public ArrayList<BrandAndQuantity> getBrands() {
        ArrayList<BrandAndQuantity> list = new ArrayList<>();
        try {
            String sql = "Select * from Brands inner join (select BrandID,Count(ProductID) as Quantity from Products group by BrandID)as b ON Brands.BrandID=b.BrandID";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                 int brandId = rs.getInt("BrandID");
                 String brandName = rs.getString("BrandName");
                 String picture= rs.getString("Picture");
                 int quantity = rs.getInt("Quantity");
                list.add(new BrandAndQuantity(brandId, brandName, picture, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args){
        ArrayList<BrandAndQuantity> brandList = new BrandDAO().getBrands();
        int count =0;
        for (BrandAndQuantity brandAndQuantity : brandList) {
            System.out.println(count);
            count++;
        }
        
    }
}

