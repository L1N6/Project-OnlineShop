/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Home;

import DAL.BrandAndQuantity;
import DAL.DBcontext;
import DAL.Home.ProductDiscountUnitOnOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author blabl
 */
public class BrandDAO extends DBcontext{
    ResultSet rs;
    PreparedStatement ps;
    public ArrayList<BrandAndQuantity> getBrands() throws SQLException {
        ArrayList<BrandAndQuantity> list = new ArrayList<>();
        try {
            String sql = "Select * from Brands inner join (select BrandID,Count(ProductID) as Quantity from Products group by BrandID)as b ON Brands.BrandID=b.BrandID";
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                 int brandId = rs.getInt("BrandID");
                 String brandName = rs.getString("BrandName");
                 String picture= rs.getString("Picture");
                 int quantity = rs.getInt("Quantity");
                list.add(new BrandAndQuantity(brandId, brandName, picture, quantity));
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }
}

